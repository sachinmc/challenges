class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0
    numbers = (1...num).to_a
    factor = []
    numbers.each do |n|
      factor << n if num % n == 0
    end
    sum = factor.reduce(:+)
    if sum > num
      'abundant'
    elsif sum < num
      'deficient'
    else
      'perfect'
    end
  end
end
