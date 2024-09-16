def knuth_first_relation(perm1, perm2):
    n = len(perm1)
    for i in range(n - 2):
        if perm1[i+1] < perm1[i] < perm1[i+2]:
            new_perm = perm1[:i] + [perm1[i], perm1[i+2], perm1[i+1]] + perm1[i+3:]
            if new_perm == perm2:
                return True
    return False

def knuth_second_relation(perm1, perm2):
    n = len(perm1)
    for i in range(n - 2):
        if perm1[i] < perm1[i+2] < perm1[i+1]:
            new_perm = perm1[:i] + [perm1[i+1], perm1[i], perm1[i+2]] + perm1[i+3:]
            if new_perm == perm2:
                return True
    return False

def apply_knuth_relations(perm1, perm2):
    first_relations = knuth_first_relation(perm1, perm2)
    second_relations = knuth_second_relation(perm1, perm2)
    both_relations = first_relations and second_relations
    return first_relations, second_relations, both_relations

def insertion_tableau(perm):
    return Tableau(perm).to_schur()

perms = list(Permutations(3))

equivalence_classes = {}
for perm1 in perms:
    for perm2 in perms:
        first_relations, second_relations, both_relations = apply_knuth_relations(perm1, perm2)
        equivalence_classes[(perm1, perm2)] = {
            'first': first_relations,
            'second': second_relations,
            'both': both_relations
            #'P-tableau': insertion_tableau(perm1)
        }

G = Graph()
for (perm1, perm2), relations in equivalence_classes.items():
    # print(f"Permutation 1: {perm1}")
    # print(f"Permutation 2: {perm2}")
    # print(f"  First relations: {relations['first']}")
    # print(f"  Second relations: {relations['second']}")
    # print(f"  Both relations: {relations['both']}")
    # print(f"  P-tableau: {relations['P-tableau']}")
    # print()
    G.add_vertex(perm1)
    G.add_vertex(perm2)
    if relations['first']:
        G.add_edge(perm1, perm2, label='first')
    if relations['second']:
        G.add_edge(perm1, perm2, label='second')
    if relations['both']:
        G.add_edge(perm1, perm2, label='both')

plot = G.plot(edge_labels=True)
plot.save("equivalence_class_graph.png")