file = File.open("puzzle.txt")
game_array = File.read("puzzle.txt").split("\n").map { |arr| arr.gsub(" ", "")}.map { |arr| arr.to_sym}

points = {
  AX: 4,
  AY: 8,
  AZ: 3,
  BX: 1,
  BY: 5,
  BZ: 9,
  CX: 7,
  CY: 2,
  CZ: 6
}

def score_calcul(array, points)
  game_points = array.map do |game|
    points[game]
  end
  game_points.sum
end


puts "Total points earned during part #1: #{score_calcul(game_array, points)}pts"

game_translate = {
  AX: :AZ,
  AY: :AX,
  AZ: :AY,
  BX: :BX,
  BY: :BY,
  BZ: :BZ,
  CX: :CY,
  CY: :CZ,
  CZ: :CX,
}

game_array2 = game_array.map do |round|
  game_translate[round]
end

puts "Total points earned during part #2: #{score_calcul(game_array2, points)}pts"


# Round #1:
# A for Rock
# B for Paper
# C for Scissors

# X for Rock
# Y for Paper
# Z for Scissors

# 1 for Rock
# 2 for Paper
# 3 for Scissors
# 0 if you lost
# 3 if the round was a draw
# 6 if you won

# Round #2:
# A for Rock
# B for Paper
# C for Scissors

# X means lose
# Y means draw
# Z means win
