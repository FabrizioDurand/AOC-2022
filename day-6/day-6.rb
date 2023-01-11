file = File.open("puzzle.txt")
message = File.read("puzzle.txt").gsub("\n", "").split("")
# p message

def uniq? (array)
  array.uniq.length == array.length
end

check = []
answer = 0
answer2 = 0

message.each_with_index do |letter, index|
  check << letter
  check << message[index+1]
  check << message[index+2]
  check << message[index+3]
  if uniq?(check)
    answer = index + 4
    break
  end
  check = []
end

p "The first answer is #{answer}"

message.each_with_index do |letter, index|
  for i in (0..13)
    check << message[index + i]
  end
  if uniq?(check)
    answer2 = index + 14
    break
  end
  check = []
end

p "The second answer is #{answer2}"
