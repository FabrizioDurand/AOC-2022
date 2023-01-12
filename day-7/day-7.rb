file = File.open("puzzle.txt")
command = File.read("puzzle.txt").split("\n").map{ |x| x.split(' ')}

pwd = []
directory_size = Hash.new { |h, k| h[k] = 0 }
sum = 0

command.each do |line|
  # p pwd
  case line
  in ["$", "cd", ".."]
    pwd.pop
    # p "changing into parent folder"
  in ["$", "cd", dir]
    pwd << dir
    # p "changing into #{dir}"
  in ["$", "ls"]
  in ["dir", directory_name]
  in [size, filename]
  # p pwd
    # p "file #{filename} has #{size} memory space used"
    pwd.length.times do |i|
      directory_size[pwd[0..i]] += size.to_i
    end
  end
end

puts "First answer is #{directory_size.values.select { |x| x <= 100_000 }.sum}"

total_space = 70_000_000
space_used = directory_size.sort_by {|_key, value| value}.last[1]
space_needed = 30_000_000
space_available = total_space - space_used
space_to_clear = space_needed - space_available

puts "Second answer is #{directory_size.values.select { |x| x >= space_to_clear }.min}"


# pattern matching used in this exercice: https://www.toptal.com/ruby/ruby-pattern-matching-tutorial
