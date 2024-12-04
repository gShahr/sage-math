# Sage Math

This repository contains my projects and code related to Sage Math.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Knuth Moves Graph](#knuth-moves-graph)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Sage Math is an open-source mathematics software system that combines various mathematical software packages into a common interface. This repository serves as a collection of my projects and code written using Sage Math.

## Installation

To use the code in this repository, you need to have Sage Math installed on your system. Follow the official [Sage Math installation guide](https://www.sagemath.org/download.html) to install it on your machine.

## Usage

Once you have Sage Math installed, you can clone this repository and explore the projects and code available. Each project is contained in its own directory and comes with its own README file explaining how to use it.

## Knuth Moves Graph

This section of the code generates and plots a graph of permutations using Knuth moves based on the shape of the tableau the user passes in. The main functions are:

- `generate_knuth_moves_bfs(permutation)`: Generates a graph of permutations using Breadth-First Search (BFS) with Knuth moves.
- `plot_knuth_moves_graph(adjacency_graph, filename)`: Plots the graph of permutations and saves it to a file.
- `generate_permutations_by_shape(shape)`: Generates a list of all permutations given a tableau shape.
- `convert_permutation_to_tableau(permutation, shape)`: Converts a permutation into a tableau with the given shape.
- `get_permutations_from_adjacency_graph(adjacency_graph)`: Retrieves the list of permutations from the adjacency graph.

## Contributing

Contributions to this repository are welcome. If you have any improvements or bug fixes, feel free to open a pull request. Please make sure to follow the [contribution guidelines](CONTRIBUTING.md).

## License

This repository is licensed under the [MIT License](LICENSE). Feel free to use the code in this repository for your own projects.
