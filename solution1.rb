def solution(a)
  # alternating heads and tails would be either solution1: 101010... or solution2: 010101...
  solution1_reverse = 0
  solution2_reverse = 0 
  test = 1
  
  a.each do |val|
    if val == test
      solution1_reverse = solution1_reverse + 1
    else
      solution2_reverse = solution2_reverse + 1
    end
    test = 1 - test
  end

  [solution1_reverse, solution2_reverse].min
end

p solution([1,0,1,0,1,1])
p solution([1,1,0,1,1])
p solution([0,1,0])
p solution([0,1,1,0])
p solution([0,0,0,0,0,0,0,0])
p solution([1,1,1,1,1,1,1,1])
p solution([0,1,0,1,0,1,0,1])
p solution([1,1,0,1,1,0,1,1])