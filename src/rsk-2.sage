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