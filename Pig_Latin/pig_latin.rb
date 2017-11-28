# check first letter of word is vowel or not
# if vowel, append 'ay' end of the word
# if not vowel, move first letter to last letter position
# append 'ay' to end of the word
class PigLatin
  def self.translate(input)
    if input.match(/ /)
     result = input.split(' ').map do |word|
       process(word)
     end
     return result.join(' ')
    end
    process(input)
  end

  def self.process(word)
    if word[0].match(/[aeiou]/) || word.slice(0,2).match(/yt|xr/)
      word << 'ay'
    elsif word.match(/qu/)
      sc = word.slice!(/.*qu/)
      word = word + sc + 'ay'
    else
      loop do
        word << word[0]
        word[0] = ''
        if word[0].match(/[aeiou]/)
          word << 'ay'
          break
        end
        break unless word.match(/[aeiou]/)
      end
    end
    word
  end
end
