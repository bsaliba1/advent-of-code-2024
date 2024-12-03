# Part 1

# Utility function used in part 1 and part 2
def safe_report?(report)
  is_increasing = nil
  report.each_with_index do |current_level, i|
    next if i === 0
    previous_level = report[i-1]
    return false if previous_level == current_level
    is_increasing = (previous_level < current_level) if is_increasing.nil?
    return false if !is_increasing.nil? && is_increasing && previous_level > current_level
    return false if !is_increasing.nil? && !is_increasing && previous_level < current_level
    return false if (previous_level - current_level).abs > 3
  end
end

safe_reports = 0
File.foreach('input.txt') do |line|
  report = line.split(" ").map(&:to_i)
  safe_reports += 1 if safe_report?(report)
end

puts "Part 1 Solutions: #{safe_reports}"

# Part 2

safe_reports = 0
File.foreach('input.txt') do |line|
  report = line.split(" ").map(&:to_i)
  report_permutations =
    (0..(report.length - 1)).map do |index_to_remove|
      duplicated_report = report.dup
      duplicated_report.delete_at(index_to_remove)
      duplicated_report
    end.append(report)
  safe_reports += 1 if report_permutations.any? { |report_permutation| safe_report?(report_permutation) }
end

puts "Part 2 Solutions: #{safe_reports}"
