# letters, space and a point - character set
# word = 20 letters max
# input = word * x , separated by one or more spaces and terminated by
# zero or more spaces followed by a point.
# output = successive words are separated by a single space with last word
# being terminated by a single point.
# odd words are copied in reverse order while even words are merely echoed.

# "whats the matter with kansas." becomes
# "whats eht matter htiw kansas."

# 1) iterate through the text
# 2) odd position words are copied in reverse order, while even position words
# are copied as is

def odd_words(input)
  output = input.split.each_with_index.map do |word, idx|
    idx.even? ? word : word.reverse
  end
  output.join(' ')
end
