Iterate all pairs of permutations that belong to Sn. Then either they have no path as they belong in different connected components or they have some path with some length d. Since all pairs of permutations are being included, then the total number of ways would be x * x.

Take one permutation in one P-equivalence class and generate all other possible permutations in the P-equivalence class. Then each permutation in the equivalence class should correspond to one connected component as you can traverse each permutation via some number of Knuth moves (or none). Now do this for all P-equivalence classes which there can at most be x which results in there being x Knuth graphs and each Knuth graph having x-vertices.

x := Number of standard young tableau with given shape lambda.
There are x P-equivalence classes. In each P equivalence class, there are x Q-tableau which 

How many permutations belong to each P-equivalence class?:
 