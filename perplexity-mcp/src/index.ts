#!/usr/bin/env node

/**
 * Perplexity MCP Server
 * Provides deep research capabilities using the Perplexity API
 */

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";

const PERPLEXITY_API_KEY = process.env.PERPLEXITY_API_KEY;

if (!PERPLEXITY_API_KEY) {
  console.error("Error: PERPLEXITY_API_KEY environment variable is required");
  process.exit(1);
}

interface PerplexityMessage {
  role: "system" | "user" | "assistant";
  content: string;
}

interface PerplexityRequest {
  model: string;
  messages: PerplexityMessage[];
  max_tokens?: number;
  temperature?: number;
  top_p?: number;
  return_citations?: boolean;
  return_images?: boolean;
  return_related_questions?: boolean;
  search_domain_filter?: string[];
  search_recency_filter?: "month" | "week" | "day" | "hour";
}

interface PerplexityResponse {
  id: string;
  model: string;
  created: number;
  usage: {
    prompt_tokens: number;
    completion_tokens: number;
    total_tokens: number;
  };
  citations?: string[];
  images?: string[];
  related_questions?: string[];
  choices: Array<{
    index: number;
    finish_reason: string;
    message: {
      role: string;
      content: string;
    };
  }>;
}

/**
 * Make a request to the Perplexity API
 */
async function queryPerplexity(params: {
  query: string;
  model?: string;
  systemPrompt?: string;
  maxTokens?: number;
  temperature?: number;
  returnCitations?: boolean;
  returnImages?: boolean;
  returnRelatedQuestions?: boolean;
  searchRecencyFilter?: "month" | "week" | "day" | "hour";
}): Promise<PerplexityResponse> {
  const {
    query,
    model = "llama-3.1-sonar-large-128k-online",
    systemPrompt,
    maxTokens = 4000,
    temperature = 0.2,
    returnCitations = true,
    returnImages = false,
    returnRelatedQuestions = true,
    searchRecencyFilter,
  } = params;

  const messages: PerplexityMessage[] = [];

  if (systemPrompt) {
    messages.push({ role: "system", content: systemPrompt });
  }

  messages.push({ role: "user", content: query });

  const requestBody: PerplexityRequest = {
    model,
    messages,
    max_tokens: maxTokens,
    temperature,
    return_citations: returnCitations,
    return_images: returnImages,
    return_related_questions: returnRelatedQuestions,
  };

  if (searchRecencyFilter) {
    requestBody.search_recency_filter = searchRecencyFilter;
  }

  const response = await fetch("https://api.perplexity.ai/chat/completions", {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${PERPLEXITY_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(requestBody),
  });

  if (!response.ok) {
    const errorText = await response.text();
    throw new Error(`Perplexity API error (${response.status}): ${errorText}`);
  }

  return await response.json() as PerplexityResponse;
}

/**
 * Format the Perplexity response for display
 */
function formatResponse(response: PerplexityResponse): string {
  let output = "";

  // Main answer
  const answer = response.choices[0]?.message?.content || "No answer received";
  output += answer + "\n\n";

  // Citations
  if (response.citations && response.citations.length > 0) {
    output += "📚 **Quellen:**\n";
    response.citations.forEach((citation, index) => {
      output += `${index + 1}. ${citation}\n`;
    });
    output += "\n";
  }

  // Related questions
  if (response.related_questions && response.related_questions.length > 0) {
    output += "🔍 **Verwandte Fragen:**\n";
    response.related_questions.forEach((question, index) => {
      output += `${index + 1}. ${question}\n`;
    });
    output += "\n";
  }

  // Token usage
  output += `📊 **Token-Nutzung:** ${response.usage.total_tokens} (Prompt: ${response.usage.prompt_tokens}, Completion: ${response.usage.completion_tokens})`;

  return output;
}

/**
 * Create the MCP server
 */
const server = new Server(
  {
    name: "perplexity-mcp",
    version: "0.1.0",
  },
  {
    capabilities: {
      tools: {},
    },
  }
);

/**
 * List available tools
 */
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return {
    tools: [
      {
        name: "perplexity_search",
        description: "Perform deep research using Perplexity AI. Returns comprehensive answers with citations and related questions. Perfect for in-depth research on any topic.",
        inputSchema: {
          type: "object",
          properties: {
            query: {
              type: "string",
              description: "The research question or topic to investigate"
            },
            model: {
              type: "string",
              description: "The Perplexity model to use",
              enum: [
                "llama-3.1-sonar-small-128k-online",
                "llama-3.1-sonar-large-128k-online",
                "llama-3.1-sonar-huge-128k-online"
              ],
              default: "llama-3.1-sonar-large-128k-online"
            },
            systemPrompt: {
              type: "string",
              description: "Optional system prompt to guide the research style"
            },
            searchRecencyFilter: {
              type: "string",
              description: "Filter results by recency",
              enum: ["month", "week", "day", "hour"]
            },
            returnImages: {
              type: "boolean",
              description: "Whether to return relevant images",
              default: false
            }
          },
          required: ["query"]
        }
      },
      {
        name: "perplexity_compare",
        description: "Compare multiple topics or concepts using Perplexity AI. Great for comparative research.",
        inputSchema: {
          type: "object",
          properties: {
            topic1: {
              type: "string",
              description: "First topic to compare"
            },
            topic2: {
              type: "string",
              description: "Second topic to compare"
            },
            aspects: {
              type: "string",
              description: "Specific aspects to compare (optional)"
            }
          },
          required: ["topic1", "topic2"]
        }
      },
      {
        name: "perplexity_deep_dive",
        description: "Perform a multi-step deep dive research on a complex topic. Asks follow-up questions automatically.",
        inputSchema: {
          type: "object",
          properties: {
            topic: {
              type: "string",
              description: "The topic to research in depth"
            },
            depth: {
              type: "number",
              description: "Number of follow-up research rounds (1-5)",
              default: 3,
              minimum: 1,
              maximum: 5
            }
          },
          required: ["topic"]
        }
      }
    ]
  };
});

/**
 * Handle tool calls
 */
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  try {
    switch (request.params.name) {
      case "perplexity_search": {
        const query = String(request.params.arguments?.query);
        const model = String(request.params.arguments?.model || "llama-3.1-sonar-large-128k-online");
        const systemPrompt = request.params.arguments?.systemPrompt
          ? String(request.params.arguments.systemPrompt)
          : undefined;
        const searchRecencyFilter = request.params.arguments?.searchRecencyFilter as "month" | "week" | "day" | "hour" | undefined;
        const returnImages = Boolean(request.params.arguments?.returnImages);

        if (!query) {
          throw new Error("Query is required");
        }

        const response = await queryPerplexity({
          query,
          model,
          systemPrompt,
          searchRecencyFilter,
          returnImages,
        });

        return {
          content: [{
            type: "text",
            text: formatResponse(response)
          }]
        };
      }

      case "perplexity_compare": {
        const topic1 = String(request.params.arguments?.topic1);
        const topic2 = String(request.params.arguments?.topic2);
        const aspects = request.params.arguments?.aspects
          ? String(request.params.arguments.aspects)
          : "";

        if (!topic1 || !topic2) {
          throw new Error("Both topics are required");
        }

        const query = aspects
          ? `Compare ${topic1} and ${topic2} in terms of: ${aspects}. Provide a detailed comparison with specific examples and evidence.`
          : `Compare and contrast ${topic1} and ${topic2}. Provide a comprehensive comparison covering key differences, similarities, advantages, and disadvantages.`;

        const response = await queryPerplexity({
          query,
          systemPrompt: "You are a research assistant specializing in comparative analysis. Provide structured, balanced comparisons with clear evidence.",
        });

        return {
          content: [{
            type: "text",
            text: formatResponse(response)
          }]
        };
      }

      case "perplexity_deep_dive": {
        const topic = String(request.params.arguments?.topic);
        const depth = Math.min(5, Math.max(1, Number(request.params.arguments?.depth || 3)));

        if (!topic) {
          throw new Error("Topic is required");
        }

        let fullReport = `# Deep Dive Research: ${topic}\n\n`;
        let currentQuery = `Provide a comprehensive overview of ${topic}. Include key concepts, current state, and important considerations.`;

        for (let i = 0; i < depth; i++) {
          fullReport += `## Round ${i + 1}${i === 0 ? ' - Overview' : ''}\n\n`;

          const response = await queryPerplexity({
            query: currentQuery,
            returnRelatedQuestions: true,
          });

          fullReport += response.choices[0]?.message?.content + "\n\n";

          if (response.citations && response.citations.length > 0) {
            fullReport += "**Sources:**\n";
            response.citations.forEach((citation, index) => {
              fullReport += `${index + 1}. ${citation}\n`;
            });
            fullReport += "\n";
          }

          // Use related questions for next round
          if (i < depth - 1 && response.related_questions && response.related_questions.length > 0) {
            currentQuery = response.related_questions[0];
            fullReport += `---\n\n`;
          }
        }

        fullReport += `\n---\n*Research completed with ${depth} rounds of investigation*`;

        return {
          content: [{
            type: "text",
            text: fullReport
          }]
        };
      }

      default:
        throw new Error(`Unknown tool: ${request.params.name}`);
    }
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : String(error);
    return {
      content: [{
        type: "text",
        text: `Error: ${errorMessage}`
      }],
      isError: true,
    };
  }
});

/**
 * Start the server
 */
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Perplexity MCP server running on stdio");
}

main().catch((error) => {
  console.error("Server error:", error);
  process.exit(1);
});
