class Prime
  def self.nth(number)
    result = []
    raise ArgumentError if number == 0
    (2..150_000).to_a.each do |x|
      break if result.size == number
      result << x if (2...x).none? { |y| x % y == 0 }
    end
    result[-1]
  end
end

p Prime.nth(6)
