class Scrabble
  SCORE_KEY = { 1 => %w(A E I O U L N R S T), 2 => %w(D G),
            3 => %w(B C M P), 4 => %w(F H V W Y),
            5 => %w(K), 8 => %w(J X), 10 => %w(Q Z) }

  attr_accessor :letters

  def initialize(string)
    @letters = string
  end

  def score
    score = 0
    return score if @letters == nil
    self.letters = letters.gsub(/[\t\s\n]/, '').upcase.chars
    letters.each do |letter|
      SCORE_KEY.each do |key, val|
        score += key if val.include?(letter)
      end
    end
    score
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
