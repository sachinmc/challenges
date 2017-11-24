class Trinary
  def initialize(num)
    @num = num
  end

  def to_decimal
    num = valid_trinary? ? @num.chars.map(&:to_i) : [0]
    result = num.each_with_index.map do |ele, idx|
      ele * (3**(num.size - 1 - idx))
    end
    result.reduce(:+)
  end

  def valid_trinary?
    /^[012]+$/.match(@num)
  end
end
