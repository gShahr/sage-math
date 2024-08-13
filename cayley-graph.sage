# Import necessary libraries
from sage.groups.perm_gps.permgroup_named import SymmetricGroup
from sage.graphs.cayley_graph import CayleyGraph

# Define the symmetric group S_n (for example, S_3)
n = 3
G = SymmetricGroup(n)

# Define the generators of the group
generators = G.gens({1, 2}, {2, 3})

# Create the Cayley graph
cayley_graph = CayleyGraph(G, generators)

# Plot the Cayley graph
cayley_graph.plot().show()