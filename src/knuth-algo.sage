import networkx as nx
import matplotlib.pyplot as plt
from collections import deque, defaultdict

def generate_knuth_moves_bfs(permutation):
    adjacency_graph = defaultdict(list)
    queue = deque([(permutation, "start")])
    visited = set()
    visited.add(tuple(permutation))
    
    while queue:
        current_permutation, move_type = queue.popleft()
        
        # Apply both Knuth moves (K1 and K2)
        for i in range(len(current_permutation) - 3):
            if (current_permutation[i + 1] < current_permutation[i] < current_permutation[i + 2] and current_permutation[i + 1] < current_permutation[i + 3] < current_permutation[i + 2]) or \
            (current_permutation[i + 2] < current_permutation[i] < current_permutation[i + 1] and current_permutation[i + 2] < current_permutation[i + 3] < current_permutation[i + 1]):
                new_permutation = current_permutation[:]
                new_permutation[i + 1], new_permutation[i + 2] = new_permutation[i + 2], new_permutation[i + 1]
                if tuple(new_permutation) not in visited:
                    queue.append((new_permutation, "Both"))
                    visited.add(tuple(new_permutation))
                    adjacency_graph[tuple(current_permutation)].append((tuple(new_permutation), "Both"))
        
        # Apply first Knuth move (K1)
        for i in range(len(current_permutation) - 2):
            if current_permutation[i + 1] < current_permutation[i] < current_permutation[i + 2] or \
            current_permutation[i + 2] < current_permutation[i] < current_permutation[i + 1]:
                new_permutation = current_permutation[:]
                new_permutation[i + 1], new_permutation[i + 2] = new_permutation[i + 2], new_permutation[i + 1]
                if tuple(new_permutation) not in visited:
                    queue.append((new_permutation, "K1"))
                    visited.add(tuple(new_permutation))
                    adjacency_graph[tuple(current_permutation)].append((tuple(new_permutation), "K1"))
        
        # Apply second Knuth move (K2)
        for i in range(len(current_permutation) - 2):
            if (current_permutation[i] < current_permutation[i + 2] < current_permutation[i + 1]) or \
            (current_permutation[i + 1] < current_permutation[i + 2] < current_permutation[i]):
                new_permutation = current_permutation[:]
                new_permutation[i], new_permutation[i + 1] = new_permutation[i + 1], new_permutation[i]
                if tuple(new_permutation) not in visited:
                    queue.append((new_permutation, "K2"))
                    visited.add(tuple(new_permutation))
                    adjacency_graph[tuple(current_permutation)].append((tuple(new_permutation), "K2"))
    
    return adjacency_graph

def plot_knuth_moves_graph(adjacency_graph, filename):
    G = nx.Graph()
    
    # Add nodes and edges to the graph
    for current_permutation, neighbors in adjacency_graph.items():
        G.add_node(current_permutation, label=str(current_permutation))
        for next_permutation, move_type in neighbors:
            G.add_node(next_permutation, label=str(next_permutation))
            G.add_edge(current_permutation, next_permutation, label=move_type)
    
    pos = nx.spring_layout(G)
    labels = nx.get_edge_attributes(G, 'label')
    nx.draw(G, pos, with_labels=True, node_size=3000, node_color='lightblue', font_size=10, font_weight='bold')
    nx.draw_networkx_edge_labels(G, pos, edge_labels=labels)
    
    plt.title("Knuth Moves Graph")
    plt.savefig(filename)
    plt.close()

def generate_permutations_by_shape(shape):
    """
    Generates a list of all permutations given a tableau shape.
    Each tableau is a valid standard tableau where:
      - Rows are increasing from left to right.
      - Columns are increasing from top to bottom.
    The function returns a list of permutations, each being a concatenation of rows.
    
    :param shape: A tuple representing the shape of the tableau (e.g., (3, 3)).
    :return: A list of permutations corresponding to the tableaux.
    """
    permutations = []
    tableaux_list = StandardTableaux(shape)
    for tableau in tableaux_list:
        permutation = []
        for row in tableau:
            permutation.extend(row)
        permutations.append(permutation)
    return permutations

def convert_permutation_to_tableau(permutation, shape):
    """
    Converts a permutation into a tableau with the given shape.
    
    :param permutation: The permutation to convert.
    :param shape: The shape of the tableau.
    :return: The tableau with the given shape.
    """
    tableau = []
    index = 0
    for row_length in shape:
        tableau.append(permutation[index:index + row_length])
        index += row_length
    return Tableau(tableau)

# permutation = [2, 1, 4, 3, 5]
shape = (4, 2)
permutations = generate_permutations_by_shape(shape)
for permutation in permutations:
    P = convert_permutation_to_tableau(permutation, shape)
    gp_S5 = RSK_inverse(P, P)
    print("Inverse RSK (S5):", gp_S5)
    adjacency_graph = generate_knuth_moves_bfs(permutation)
    print("Original permutation:", permutation)
    print("Adjacency graph:", adjacency_graph)
    reversed_elements = sum(P.to_list()[::-1], [])
    file_name = ''.join(map(str, reversed_elements)) + ".png"
    plot_knuth_moves_graph(adjacency_graph, file_name)