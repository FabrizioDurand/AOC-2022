file = File.open("puzzle.txt")
assign = File.read("puzzle.txt").split("\n")
sum = 0
sum_bis = 0

assign.each do |duo|
  # Creating range array for each duo of elves
  first = duo.split(",")[0].split("-")
  second = duo.split(",")[1].split("-")
  one = (first[0]..first[1]).to_a
  two = (second[0]..second[1]).to_a
  # Comparing if one is included in two and reverse. If it's the case, sum is added 1
  if (one - two).empty?
    sum += 1
  elsif (two - one).empty?
    sum += 1
  end
end

puts "In #{sum} assignment pairs one range fully contain the other."

assign.each do |duo|
  # Creating range array for each duo of elves
  first = duo.split(",")[0].split("-")
  second = duo.split(",")[1].split("-")
  one = (first[0]..first[1]).to_a
  two = (second[0]..second[1]).to_a
  # Comparing if one has similarity with two and reverse. If it's the case, sum is added 1
  sum_bis += 1 unless (one & two).empty?
end

puts "In #{sum_bis} assignment pairs the ranges overlap."
