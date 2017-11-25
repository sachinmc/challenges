class Phrase
  def initialize(words)
    @words = words.downcase.gsub(/[^\w+]/, ' ')
  end

  def word_count
    hash = Hash.new(0)
    @words.split.each do |word|
      hash[word] += 1
    end
    hash
  end
end
