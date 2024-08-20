G=SymmetricGroup(3)
CG = G.cayley_graph(generators=[G((1,2)),G((2,3))])
CGU = CG.to_directed()
CGU.show()
plot = CGU.plot(edge_labels=True)
plot.save('s3-cayley-graph.png')

Q8 = QuaternionGroup()
CG = Q8.cayley_graph(generators=[Q8.gen(0), Q8.gen(1)])
CGU = CG.to_directed()
CGU.show()
plot = CGU.plot(edge_labels=True)
plot.save('q8-cayley-graph.png')

G = SymmetricGroup(4)
generators = [G((1,2)), G((2,3)), G((3,4))]
CG = G.cayley_graph(generators=generators)
CGU = CG.to_undirected()
plot = CGU.plot(edge_labels=True)
plot.save('s4-cayley-graph.png')
plot.show()

# Define the Knuth relations
def knuth_first_relation(perm):
    n = len(perm)
    for i in range(n - 2):
        if perm[i] < perm[i + 2] < perm[i + 1]:
            new_perm = perm[:i] + (perm[i + 1], perm[i], perm[i + 2]) + perm[i + 3:]
            yield new_perm

def knuth_second_relation(perm):
    n = len(perm)
    for i in range(n - 2):
        if perm[i + 1] < perm[i] < perm[i + 2]:
            new_perm = perm[:i] + (perm[i + 1], perm[i], perm[i + 2]) + perm[i + 3:]
            yield new_perm

# Example permutation in S3
perm = (2, 1, 3, 4)

# Apply Knuth relations
first_relation_results = list(knuth_first_relation(perm))
second_relation_results = list(knuth_second_relation(perm))

print(f"Original permutation: {perm}")
print(f"First relation results: {first_relation_results}")
print(f"Second relation results: {second_relation_results}")

def generate_permutohedron(n):
    perms = list(Permutations(n))
    G = Graph()
    for perm in perms:
        G.add_vertex(perm)
    for i in range(len(perms)):
        for j in range(i + 1, len(perms)):
            diff_positions = [k for k in range(n) if perms[i][k] != perms[j][k]]
            if len(diff_positions) == 2 and abs(diff_positions[0] - diff_positions[1]) == 1:
                G.add_edge(perms[i], perms[j])
    return G

permutohedron = generate_permutohedron(4)
plot = permutohedron.plot(edge_colors=True, vertex_labels=True)
plot.show()
plot.save('permutohedron_order_4.png')