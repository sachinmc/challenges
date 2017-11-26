class BeerSong
  def verse(number)
    string = number - 1 <= 1 ? "bottle" : "bottles"
    if number == 1
      line_one = "#{number} bottle"
      line_two = "Take it down and pass it around, no more bottles"
    end
    if number == 0
      line_one = "No more bottles"
      line_two = "Go to the store and buy some more, 99 bottles"
    end
    if number > 1
      line_one =  "#{number} bottles"
      line_two = "Take one down and pass it around, #{number - 1} #{string}"
    end
    final = line_one + " of beer on the wall, " + line_one.downcase + " of beer.\n" +
    line_two + " of beer on the wall.\n"
  end

  def verses(num_first, num_last)
    final = ''
    num_first.downto(num_last) do |num|
      final += verse(num) + "\n"
    end
    final.chop
  end

  def lyrics
    verses(99, 0)
  end
end
