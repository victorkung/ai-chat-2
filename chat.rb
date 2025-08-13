require "ai-chat"
require "dotenv/load"

c = AI::Chat.new

c.schema = '{
  "name": "meal_nutrition_estimate",
  "schema": {
    "type": "object",
    "properties": {
      "rationale": {
        "type": "string",
        "description": "Explanation of how you came to the estimates for the nutritional values of the items and totals."
      },
      "items": {
        "type": "array",
        "description": "List of food items with their corresponding macronutrient and calorie values.",
        "items": {
          "type": "object",
          "properties": {
            "description": {
              "type": "string",
              "description": "Description or name of the food item."
            },
            "grams_of_carbs": {
              "type": "integer",
              "description": "Amount of carbohydrates in grams."
            },
            "grams_of_fat": {
              "type": "integer",
              "description": "Amount of fat in grams."
            },
            "grams_of_protein": {
              "type": "integer",
              "description": "Amount of protein in grams."
            },
            "calories": {
              "type": "integer",
              "description": "Total calories contained in the item."
            }
          },
          "required": [
            "description",
            "grams_of_carbs",
            "grams_of_fat",
            "grams_of_protein",
            "calories"
          ],
          "additionalProperties": false
        }
      },
      "total_grams_of_carbs": {
        "type": "integer",
        "description": "Total grams of carbohydrates for all items."
      },
      "total_grams_of_fat": {
        "type": "integer",
        "description": "Total grams of fat for all items."
      },
      "total_grams_of_protein": {
        "type": "integer",
        "description": "Total grams of protein for all items."
      },
      "total_calories": {
        "type": "integer",
        "description": "Total calories for all items."
      }
    },
    "required": [
      "rationale",
      "items",
      "total_grams_of_carbs",
      "total_grams_of_fat",
      "total_grams_of_protein",
      "total_calories"
    ],
    "additionalProperties": false
  },
  "strict": true
}'

c.system("You are an expert nutritionist. Do your best to estimate the number of calories in the user-provided image(s).")
c.user("What is the nutritional profile in both of these image?", images: ["1.webp", "2.png"])





pp c.generate!
