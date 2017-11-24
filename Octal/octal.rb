class Octal
  def initialize(num_str)
    @num_str = num_str
  end

  def to_decimal
    number = valid_octal? ? @num_str.chars.map(&:to_i) : [0]
    result = number.each_with_index.map do |num, idx|
      num * (8**(number.size - 1 - idx))
    end
    result.reduce(:+)
  end

  def valid_octal?
    return false if @num_str.chars.any? {|num| num == '8' || num == '9'}
    /^\d+$/.match(@num_str)
  end
end
