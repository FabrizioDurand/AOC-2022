file = File.open("puzzle.txt")
calories_array = File.read("puzzle.txt").split("\n\n").map do |arr|
  arr.gsub("\n", " ").split
end

calories_array_int = calories_array.map do |arr|
  arr.map { |number| number.to_i}
end

sum_calories = calories_array_int.map { |arr| arr.sum }
max_elf_calories = sum_calories.max
p "The elf carrying the most calories is carrying #{max_elf_calories} calories!"

top_3_sum = 0

3.times do
  top_3_sum += sum_calories.max
  sum_calories.delete_at(sum_calories.index(sum_calories.max))

end
p "The 3 elves carrying the most calories are carrying #{top_3_sum} calories!"
