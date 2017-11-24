class SumOfMultiples
  def initialize(*args)
    @multiples = args
  end

  def to(limit)
    result = []
    return 0 if limit == 1
    @multiples.each do |factor|
      1.upto(limit - 1) do |num|
        result << num if num % factor == 0 && !result.include?(num)
      end
    end
    result.reduce(:+)
  end

  def self.to(limit)
    SumOfMultiples.new(3,5).to(limit)
  end
end

#class SumOfMultiples
#  attr_reader :multiples

#  @@multiples = [3,5]

#  def initialize(*args)
#    @@multiples = args
#  end

#  def self.to(limit)
#    result = []
#    return 0 if limit == 1
#    @@multiples.each do |factor|
#      binding.pry
#      1.upto(limit - 1) do |num|
#        result << num if num % factor == 0 && !result.include?(num)
#      end
#    end
#    result.reduce(:+)
#  end

#  def to(limit)
#    # also, self.class.to(limit)
#    SumOfMultiples.to(limit)
#  end
#end


# Iteration
# 1
# class SumOfMultiples
#   def initialize
#     @multiples = [3,5]
#   end

#   def to(limit)
#     result = []
#     1.upto(limit - 1) do |n|
#       if n % 5 == 0
#         result << n
#       elsif n % 3 == 0
#         result << n
#       end
#     end
#     result.reduce(:+)
#   end
# end
