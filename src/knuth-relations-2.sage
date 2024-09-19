from sage.combinat.permutation import Permutation
from sage.graphs.graph import Graph

def knuth_first_relation(perm):
    """Generate all permutations obtained by the first Knuth relation."""
    n = len(perm)
    knuth_first_perms = []
    for i in range(n - 2):
        if perm[i+1] < perm[i] < perm[i+2]:
            new_perm = perm[:i] + [perm[i], perm[i+2], perm[i+1]] + perm[i+3:]
            knuth_first_perms.append(new_perm)
    return knuth_first_perms

def knuth_second_relation(perm):
    """Generate all permutations obtained by the second Knuth relation."""
    n = len(perm)
    knuth_second_perms = []
    for i in range(n - 2):
        if perm[i] < perm[i+2] < perm[i+1]:
            new_perm = perm[:i] + [perm[i+1], perm[i], perm[i+2]] + perm[i+3:]
            knuth_second_perms.append(new_perm)
    return knuth_second_perms

def generate_knuth_graph(perm):
    """Generate the Knuth graph for a given permutation."""
    G = Graph()
    visited = set()
    queue = [perm]
    
    while queue:
        current_perm = queue.pop(0)
        if tuple(current_perm) in visited:
            continue
        visited.add(tuple(current_perm))
        G.add_vertex(current_perm)
        
        # Apply first Knuth relation
        first_relations = knuth_first_relation(current_perm)
        for new_perm in first_relations:
            G.add_vertex(new_perm)
            G.add_edge(current_perm, new_perm, label='first')
            if tuple(new_perm) not in visited:
                queue.append(new_perm)
        
        # Apply second Knuth relation
        second_relations = knuth_second_relation(current_perm)
        for new_perm in second_relations:
            G.add_vertex(new_perm)
            G.add_edge(current_perm, new_perm, label='second')
            if tuple(new_perm) not in visited:
                queue.append(new_perm)
    
    return G

# Example usage with a permutation from S5
perm = [4, 2, 7, 3, 6, 1, 5]
knuth_graph = generate_knuth_graph(perm)

# Plot the Knuth graph
plot = knuth_graph.plot(edge_labels=True)
plot.show()