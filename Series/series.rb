# "01234"
# start at the begining of the string
# if length n is less than size of string, count length n from start of string
#   slice and return
# move onto the next character
# if length n is less than new size of string, count length n from start of string
#   slice and return
# if length n is greater than size of string, return series, exit program

class Series
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def slices(size)
    raise ArgumentError if size > string.length
    series = []
    string.chars.each_cons(size) do |slice|
      series << slice.map(&:to_i)
    end
    series
  end
end


# Iterations:
# 1st
# def slices(length)
#   raise ArgumentError if length > string.size
#   series = []
#   idx = 0
#   loop do
#     if idx + length <= string.size
#       series << string.slice(idx,length).split('').map(&:to_i)
#     else
#       break
#     end
#     idx += 1
#   end
#   series
# end
#
# without Enumerable#each_cons
# ..
