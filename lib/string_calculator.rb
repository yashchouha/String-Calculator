class StringCalculator
  def self.add(input)
    return 0 if input.strip.empty?

    delimiter = /,|\n/
    numbers_str = input

    if input.start_with?("//")
      delimiter_line, numbers_str = input.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end

    numbers = numbers_str.split(/#{delimiter}/).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }

    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    numbers.sum
  end
end
