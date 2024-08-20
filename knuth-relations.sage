def knuth_first_relation(perm1, perm2):
    n = len(perm1)
    for i in range(n - 2):
        if perm1[i] < perm1[i + 2] < perm1[i + 1]:
            new_perm = perm1[:i] + (perm1[i + 1], perm1[i], perm1[i + 2]) + perm1[i + 3:]
            if new_perm == perm2:
                return True
    return False

def knuth_second_relation(perm1, perm2):
    n = len(perm1)
    for i in range(n - 2):
        if perm1[i + 1] < perm1[i] < perm1[i + 2]:
            new_perm = perm1[:i] + (perm1[i + 1], perm1[i], perm1[i + 2]) + perm1[i + 3:]
            if new_perm == perm2:
                return True
    return False

def apply_knuth_relations(perm):
    first_relations = list(knuth_first_relation(perm))
    second_relations = list(knuth_second_relation(perm))
    both_relations_union = first_relations + second_relations
    both_relations_intersection = list(set(first_relations) & set(second_relations))
    return first_relations, second_relations, both_relations_intersection

def insertion_tableau(perm):
    return Tableau(perm).to_schur()

perms = list(Permutations(4))

equivalence_classes = {}
for perm in perms:
    first_relations, second_relations, both_relations = apply_knuth_relations(perm)
    equivalence_classes[perm] = {
        'first': first_relations,
        'second': second_relations,
        'both': both_relations,
        'P-tableau': insertion_tableau(perm)
    }

for perm, relations in equivalence_classes.items():
    print(f"Permutation: {perm}")
    print(f"  First relations: {relations['first']}")
    print(f"  Second relations: {relations['second']}")
    print(f"  Both relations: {relations['both']}")
    print(f"  P-tableau: {relations['P-tableau']}")
    print()