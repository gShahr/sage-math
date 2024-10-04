# Define the symmetric group S5
S5 = list(Permutations(5))

# Generate a permutation from S5
perm_S5 = S5[0]
print("Permutation from S5:", perm_S5)

# Compute RSK for the permutation from S5
P_S5, Q_S5 = RSK(perm_S5)
print("P (S5):", P_S5)
print("Q (S5):", Q_S5)

# Compute inverse RSK for the permutation from S5
gp_S5 = RSK_inverse(P_S5, Q_S5)
print("Inverse RSK (S5):", gp_S5)

P =  Tableau([[1, 2, 5], [3, 6], [4, 7]])
Q = Tableau([[1, 3, 5], [2, 4], [6, 7]])
gp_S5 = RSK_inverse(P, Q)
print("Inverse RSK (S5):", gp_S5)

Q1 = Tableau([[1, 3, 6], [2, 4], [5, 7]])
gp_S5 = RSK_inverse(P, Q1)
print("Inverse RSK (S5):", gp_S5)

P = Tableau([[1, 2, 5], [3, 6], [4, 7]])
gp_S5 = RSK_inverse(P, P)
print("Inverse RSK (S5):", gp_S5)

P = Tableau([[1, 2, 4], [3], [5]])
gp_S5 = RSK_inverse(P, P)
print("Inverse RSK (S5):", gp_S5)
