class Anagram
  def initialize(string)
    @string = string.downcase
  end

  def match(candidates)
    candidates.select do |to_match|
      next if to_match.downcase == @string
      @string.chars.sort == to_match.downcase.chars.sort
    end
  end
end
