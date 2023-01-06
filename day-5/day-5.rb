file = File.open("puzzle.txt")
tasks = File.read("puzzle.txt").split("\n")
stack_1 = %w(W D G B H R V)
stack_2 = %w(J N G C R F)
stack_3 = %w(L S F H D N J)
stack_4 = %w(J D S V)
stack_5 = %w(S H D R Q W N V)
stack_6 = %w(P G H C M)
stack_7 = %w(F J B G L Z H C)
stack_8 = %w(S J R)
stack_9 = %w(L G S R B N V M)
stack_array = [stack_1, stack_2, stack_3, stack_4, stack_5, stack_6, stack_7, stack_8, stack_9]

# Transforming task in only sub-arrays numbers
tasks = tasks.map { |task| task.gsub("move ", '').gsub(" from ", ",").gsub(" to ", ",").split(",")}
tasks = tasks.map do |task|
  task.map { |string| string.to_i}
end

def first_answer (tasks, stack_array)
  # For each task, we do it the right number of times, we put the crate to transfer in transfer variable and push it into the right array
  tasks.each do |task|
    task[0].times do
      transfer = stack_array[task[1]-1].pop
      stack_array[task[2]-1] << transfer
    end
  end

  answer = []

  for i in (0...9) do
    answer << stack_array[i].last
  end
  answer.join
end

def second_answer (tasks, stack_array)
  tasks.each do |task|
    transfer = []
    # instead of doing it step by step we save all the crates in a transfer array
    task[0].times do
      transfer << stack_array[task[1]-1].pop
    end
    # we reverse the array and we push the crates in the right stack
    transfer.reverse!
    for i in (0...transfer.size)
      stack_array[task[2]-1] << transfer[i]
    end
  end

  answer = []

  for i in (0...9) do
    answer << stack_array[i].last
  end
  answer.join
end


puts "Answer is: #{second_answer(tasks, stack_array)}"
