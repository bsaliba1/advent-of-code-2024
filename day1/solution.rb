# Part 1

list1 = []
list2 = []
File.foreach('input.txt') do |line|
  list1_element, list2_element = line.split("   ").map(&:to_i)
  list1 << list1_element
  list2 << list2_element
end
list1 = list1.sort
list2 = list2.sort
sum = 0
list1.each_with_index do |value, i|
  sum += (value - list2[i]).abs
end

puts "Part 1 Solution: #{sum}"


# Part 2
similarity_score = 0
list1.each do |value|
  similarity_score += value * list2.count(value)
end

puts "Part 2 Solution: #{similarity_score}"

