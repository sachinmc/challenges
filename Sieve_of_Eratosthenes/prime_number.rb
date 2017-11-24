# A prime number is a natural number greater than 1, that has no positive divisors
# other than 1 and itself (opposite of prime is composite)
# def primes(num)
#   result = [2]
#   3.upto(num) do |num|
#     n = 2
#     bool = true
#     while n < num
#       bool = false if num % n == 0
#       n += 1
#     end
#     result << num if bool
#   end
#   result
# end

# def primes(num)
#   prime_nos = []
#   (2..num).each do |number|
#     bool = true
#     (2...number).each do |divisor|
#       bool = false if number % divisor == 0
#     end
#     prime_nos << number if bool
#   end
#   prime_nos
# end

# for the first number x = 2, 2 % (2...2), 2 % nil(?) != 0 so returns true for
# select ..
def primes(num)
  (2..num).to_a.select do |x|
    (2...x).none? { |y| x % y == 0 }
  end
end
