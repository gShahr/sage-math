def rsk_insertion(P, x):
    """Insert x into the tableau P using RSK insertion rules."""
    row = 0
    while row < len(P):
        i = 0
        while i < len(P[row]) and P[row][i] < x:
            i += 1
        if i < len(P[row]):
            x, P[row][i] = P[row][i], x
        else:
            P[row].append(x)
            return
        row += 1
    P.append([x])

def rsk(sequence):
    """Compute the RSK algorithm for a given sequence."""
    P = []
    Q = []
    for i, x in enumerate(sequence):
        rsk_insertion(P, x)
        if len(Q) < len(P):
            Q.append([i + 1])
        else:
            Q[len(P) - 1].append(i + 1)
    return P, Q

def rsk_inverse(P, Q):
    """Compute the inverse RSK algorithm for given tableaux P and Q."""
    sequence = []
    while P:
        row = len(P) - 1
        col = len(P[row]) - 1
        sequence.append(P[row][col])
        P[row].pop()
        if not P[row]:
            P.pop()
        if Q[row]:
            Q[row].pop()
        if not Q[row]:
            Q.pop()
    sequence.reverse()
    return sequence

# Example usage
sequence = [4, 2, 7, 3, 6, 1, 5]
P, Q = rsk(sequence)
print("P:", P)
print("Q:", Q)

# Compute inverse RSK
inverse_sequence = rsk_inverse(P, Q)
print("Inverse sequence:", inverse_sequence)