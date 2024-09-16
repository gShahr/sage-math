# Define the permutation
permutation = [4, 2, 7, 3, 6, 1, 5]

# Compute RSK
P, Q = RSK(permutation)
print("P:", P)
print("Q:", Q)

# Compute inverse RSK
gp = RSK_inverse(P, Q)
print("Inverse RSK:", gp)

# Verify RSK and inverse RSK
print("RSK(*gp):", RSK(*gp))

# Additional examples
print("RSK([2, 3, 2, 1, 2, 3]):", RSK([2, 3, 2, 1, 2, 3]))
print("RSK([2, 3, 2, 1, 2, 3], insertion=RSK.rules.EG):", RSK([2, 3, 2, 1, 2, 3], insertion=RSK.rules.EG))

# Using tableaux
p = Tableau([[1, 2, 2], [2]])
q = Tableau([[1, 3, 3], [2]])
m = RSK_inverse(p, q, 'matrix')
print("Matrix form of inverse RSK:", m)
print("RSK(m):", RSK(m))