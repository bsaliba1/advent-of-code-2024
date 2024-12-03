# Part 1
sum = 0
regex = /mul\(\d+,\d+\)/
File.foreach('input.txt') do |line|
  matches = line.scan(regex)
  matches.each do |match|
    x, y = match.gsub("mul(", "").gsub(")", "").split(",").map(&:to_i)
    sum += x*y
  end
end
puts "Part 1 Solution: #{sum}"

# Part 2
sum = 0
regex = /mul\(\d+,\d+\)|do\(\)|don't\(\)/
skip = false
File.foreach('input.txt') do |line|
  matches = line.scan(regex)
  matches.each do |match|
    next(skip = true) if match == "don't()"
    next(skip = false)if match == "do()"
    next if skip
    x, y = match.gsub("mul(", "").gsub(")", "").split(",").map(&:to_i)
    sum += x*y
  end
end
puts "Part 2 Solution: #{sum}"
