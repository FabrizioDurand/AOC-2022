file = File.open("puzzle.txt")
rucksack = File.read("puzzle.txt").split("\n")

priority = {
  a: 1,
  b: 2,
  c: 3,
  d: 4,
  e: 5,
  f: 6,
  g: 7,
  h: 8,
  i: 9,
  j: 10,
  k: 11,
  l: 12,
  m: 13,
  n: 14,
  o: 15,
  p: 16,
  q: 17,
  r: 18,
  s: 19,
  t: 20,
  u: 21,
  v: 22,
  w: 23,
  x: 24,
  y: 25,
  z: 26,
  A: 27,
  B: 28,
  C: 29,
  D: 30,
  E: 31,
  F: 32,
  G: 33,
  H: 34,
  I: 35,
  J: 36,
  K: 37,
  L: 38,
  M: 39,
  N: 40,
  O: 41,
  P: 42,
  Q: 43,
  R: 44,
  S: 45,
  T: 46,
  U: 47,
  V: 48,
  W: 49,
  X: 50,
  Y: 51,
  Z: 52
}

# Divide each rucksack into to equal substrings
common_rucksack = rucksack.map { |items| items.split("").each_slice((items.length/2)).to_a}
# Extracting the common letter and converting it to a symbol
common_rucksack = common_rucksack.map { |arr| arr[0] & arr[1]}.map { |arr| arr.join.to_sym}
# converting each letter to its priority
priorities = common_rucksack.map { |sym| priority[sym]}

puts "Sum of priorites is #{priorities.sum}"

# Divide the rucksack array into 3 rucksacks sub-arrays
three_elves = rucksack.each_slice(3).to_a
# Extracting the letter in common in each group of 3 rucksack and converting it to symbols
three_elves = three_elves.map do |arr|
  (arr[0].split("") & arr[1].split("") & arr[2].split(""))
end.map { |arr| arr.join.to_sym}
# converting each letter to its priority
new_priorities = three_elves.map { |sym| priority[sym]}

puts "Sum of badge priorites is #{new_priorities.sum}"


# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.
