# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
# start with 2, cross out every 2nd number from 2 (they are multiples of 2)
# the next number after 2 is 3, cross out every 3rd number, and so on
# for nth number, where n * n > limit, return list, this list will be list of
# prime numbers

# outer iteration is picking each unmarked number
# innter iteration is marking the multiples of the unmarked number
class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    range = (2..limit).to_a
    range.each do |unmarked|
      next unless unmarked.is_a?(Integer)
      sum = unmarked
      until sum >= limit
        sum += unmarked
        next if range.index(sum) == nil # marked
        range[range.index(sum)] = 'X'
      end
    end
    range.select { |ele| ele.is_a?(Integer) }
  end
end


# Iterations:
#
# def primes
#   range = (2..limit).to_a
#   idx = 0
#   while idx < range.size
#     num = range[idx]
#     break if range[idx]**2 > limit
#     if range[idx] == 0
#       idx += 1
#       next
#     end
#     loop do
#       # binding.pry
#       num += range[idx]
#       break if num > limit
#       next if range.index(num) == nil
#       index = range.index(num)
#       range[index] = 0
#     end
#     idx += 1
#   end
#   range
# end
#
# def primes
#   range = (2..limit).to_a
#   range.each do |unmarked|
#     next unless unmarked.is_a?(Integer)
#     sum = unmarked
#     until sum >= limit
#       sum += unmarked
#       next if range.index(sum) == nil # marked
#       range[range.index(sum)] = 'X'
#     end
#   end
#   range.select { |ele| ele.is_a?(Integer) }
# end
