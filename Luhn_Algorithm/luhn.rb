# count from right, double the value of every second digit
# after doubling, any digit that results in a value that is greater than 10 should
# be substracted by 9
# the checksum is the sum of all digits
# checksum % 10 should return 0 for it to be a valid according to Luhn formula

# invalid:
# 1111
# 2121 = 6

# valid:
# 8763
# 7733 = 20

class Luhn
  def initialize(number)
    @num = number.to_s
  end

  def addends(num_arr = @num.chars)
    result = []
    num_arr.each_with_index do |val, idx|
      if num_arr.size.odd?
        if idx.odd?
          n = val.to_i * 2
          n = n - 9 if n >= 10
          result << n
        else
          result << val.to_i
        end
      else
        if idx.odd?
          result << val.to_i
        else
          n = val.to_i * 2
          n = n - 9 if n >= 10
          result << n
        end
      end
    end
    result
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def create
    0.upto(9) do |n|
      @num << n.to_s  # adding digit to end of numeric string
      return @num.to_i if valid?
      @num[-1] = ''
    end
  end

  def self.create(number)
    Luhn.new(number).create
  end
end

# p Luhn.new(1111).create
# p Luhn.new(123).create
# p Luhn.new(8763).addends
# p Luhn.new(873_956).create
# p Luhn.new(8_739_567).addends
# p Luhn.new(1234).addends
# p Luhn.new(12345).addends
# p Luhn.new(2323200577663554).checksum
# p Luhn.new(5434582304405873).checksum
