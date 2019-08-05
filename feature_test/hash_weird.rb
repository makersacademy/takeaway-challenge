
hash_def = Hash.new(0)
p hash_def

hash_def[:a]
p hash_def
p hash_def[:a]

hash_def[:b] = 2
p hash_def
p hash_def[:a]
p hash_def[:b]

hash_def[:c] += 1
p hash_def
p hash_def[:a]
p hash_def[:b]
p hash_def[:c]
