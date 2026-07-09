# Recipe Recommendation & Health Analysis Agent

A toy project designed to learn the integration of Prolog (Logic Programming) and Python, as well as agent reasoning logic. When a user inputs the ingredients currently available in their refrigerator, the system suggests recipes that can be cooked with those ingredients. Furthermore, based on a Knowledge Base, it analyzes the nutritional components and healthiness of the ingredients within the suggested dishes.

##  Project Learning Objectives

* **Multi-Paradigm Programming Integration:** Understand the process of interfacing and binding data between an imperative/object-oriented language (Python) and a logic programming language (Prolog).
* **Knowledge Base System Construction:** Define facts and rules to learn algorithms that utilize a logical reasoning engine beyond a traditional structured database (DB).

##  Key Features & Operating Principles

### 1. Ingredient-Based Recipe Inference
When a user inputs their available ingredients (e.g., chicken, onion, potato), Prolog's rule engine matches them against the recipes within the knowledge base to infer which dishes can be prepared.

### 2. Rule-Based Health & Nutrition Analysis
Instead of simply listing recipes, the system analyzes the nutritional characteristics (calories, sodium, nutrient balance, etc.) of the ingredients in each dish using Prolog rules. It logically determines whether a specific combination of ingredients is beneficial to the body or unhealthy if consumed in excess, providing actionable feedback to the end-user.

### 3. Prolog Reasoning Engine Optimization (*Arrumar Agente*)
Moving away from a legacy structure where Prolog was used merely as a database for storing simple facts, this project refactors and improves the logical reasoning process. By defining organic relationships between rules, it enables the agent to make autonomous "decisions" and judgments.
