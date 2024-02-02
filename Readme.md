# Neuroevolution Dino Game

Neuroevolution Dino Game is a comprehensive project developed in the Processing environment, employing neuroevolutionary algorithms to train agents for playing the Dino Game, the iconic side-scrolling game associated with Google Chrome's offline mode. This README provides an extensive overview of the code structure, key classes, and the neuroevolution algorithm utilized in this project.

## Table of Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [How to Use](#how-to-use)
- [Code Structure](#code-structure)
- [Neuroevolution Algorithm](#neuroevolution-algorithm)
- [Classes](#classes)
  - [DinoGame](#dinogame)
  - [Player](#player)
  - [Genome](#genome)
  - [Species](#species)
  - [ConnectionGene](#connectiongene)
  - [ConnectionHistory](#connectionhistory)
- [Settings and Configurations](#settings-and-configurations)

## Overview

This project integrates neuroevolutionary algorithms with the Dino Game to evolve neural networks controlling dinosaur agents. The neuroevolution process involves the evolution of genomes (neural network architectures) through mechanisms such as selection, crossover, mutation, and fitness evaluation. The project is organized into modular components, allowing for a clear understanding of the code structure.

## Dependencies

- **Processing:** This project is built using the Processing programming environment. Ensure Processing is installed before running the code.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   ```
2. **Open the Main File:**

   Open the main file `DinoGameNeuroevolution.pde` using Processing.
3. **Run the Processing Sketch:**

   Run the Processing sketch to launch the Dino Game with neuroevolution.

## How to Use

- The Dino Game window will open, and neuroevolution will train agents to play the game.
- Press the 's' key to toggle the visibility of neural network connections.
- Observe the progress of the neuroevolution algorithm in the console.

## Code Structure

The code is structured into several components for clarity and modularity:

- **`DinoGameNeuroevolution.pde`**: Main Processing sketch integrating the game and neuroevolution components.
- **`DinoGame.pde`**: Implementation of the Dino Game environment.
- **`Player.pde`**: Player class representing dinosaur agents.
- **`Genome.pde`**: Genome class defining the neural network architecture.
- **`Species.pde`**: Management of player species and implementation of the neuroevolution algorithm.
- **`ConnectionGene.pde`**: Representation of connections between nodes in the neural network.
- **`ConnectionHistory.pde`**: Tracking the history of connections in genomes.

## Neuroevolution Algorithm

The neuroevolution algorithm follows a species-based approach:

- **Species Management:** Players are grouped into species based on genetic similarity.
- **Genome Evolution:** Evolution of neural network architectures through selection, crossover, mutation, and fitness evaluation.
- **Crossover:** Players undergo crossover to produce offspring with a combination of their genetic material.
- **Mutation:** Various mutations include changes in weights, addition of new connections, and enabling/disabling existing connections in neural networks.
- **Fitness Sharing:** Fitness is shared among players within the same species to promote diversity and avoid domination.
- **Selection:** Players are selected for reproduction based on their fitness.

## Classes

### `DinoGame`

- **Responsibilities:**

  - Manages the Dino Game environment.
  - Handles game initialization, updating, rendering, and collision detection.
- **Methods:**

  - `void setup()`: Initializes the game environment.
  - `void draw()`: Updates and renders the game.
  - `void keyPressed()`: Handles key presses for toggling neural network connection visibility.

### `Player`

- **Responsibilities:**

  - Represents Dino Game agents.
  - Maintains fitness, neural network (genome), and provides functions for cloning, crossover, and mutation.
- **Methods:**

  - `Player cloneForReplay()`: Creates a clone for replay purposes.
  - `Player crossover(Player partner)`: Performs crossover with another player.
  - `void calculateFitness()`: Calculates the fitness of the player.

### `Genome`

- **Responsibilities:**

  - Defines the neural network architecture of players.
  - Includes functions for mutation, crossover, and cloning.
- **Methods:**

  - `Genome crossover(Genome partner)`: Performs crossover with another genome.
  - `void mutate(ArrayList<ConnectionHistory> innovationHistory)`: Mutates the genome.

### `Species`

- **Responsibilities:**

  - Manages groups of players (species) based on genetic similarity.
  - Implements the neuroevolution algorithm, including selection, crossover, mutation, and fitness sharing.
- **Methods:**

  - `void sortSpecies()`: Sorts species by fitness.
  - `Player giveMeBaby(ArrayList<ConnectionHistory> innovationHistory)`: Generates a new player for the species.
  - `Player selectPlayer()`: Selects a player based on fitness for reproduction.
  - `void cull()`: Kills off the bottom half of the species.

### `ConnectionGene`

- **Responsibilities:**

  - Represents a connection between two nodes in the neural network.
  - Includes functions for weight mutation and cloning.
- **Methods:**

  - `void mutateWeight()`: Mutates the weight of the connection.
  - `ConnectionGene clone(Node from, Node to)`: Creates a clone of the connection.

### `ConnectionHistory`

- **Responsibilities:**

  - Tracks the history of connections in the genome to test for matching genomes.
  - Determines whether a genome matches the original genome before a specific connection was added.
- **Methods:**

  - `boolean matches(Genome genome, Node from, Node to)`: Checks if a genome matches the original genome and the connection is between the same nodes.

## Settings and Configurations

- **Excess Coefficient (`float excessCoeff`):** Coefficient for testing compatibility regarding excess genes.
- **Weight Difference Coefficient (`float weightDiffCoeff`):** Coefficient for testing compatibility based on the average weight difference between matching genes.
- **Compatibility Threshold (`float compatibilityThreshold`):** Threshold for determining whether a genome belongs to the same species.
- **Staleness Counter (`int staleness`):** Number of generations a species has gone without improvement.
- **Mutation Rate (`float mutationRate`):** Probability of mutation occurring during evolution.
- **Connection Mutation Rate (`float connectionMutationRate`):** Probability of mutation for connection weights.
- **Add Node Mutation Rate (`float addNodeMutationRate`):** Probability of mutation for adding a new node.
- **Add Connection Mutation Rate (`float addConnectionMutationRate`):** Probability of mutation for adding a new connection.
- **Enable Connection Mutation Rate (`float enableConnectionMutationRate`):** Probability of mutation for enabling an existing connection.
- **Disable Connection Mutation Rate (`float disableConnectionMutationRate`):** Probability of mutation for disabling an existing connection.
