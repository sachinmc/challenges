require 'date'
require 'pry'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    weekday = weekday.to_s + "?"
    case schedule
      when :teenth then teenth(weekday)
      when :first then first(weekday)
      when :second then second(weekday)
      when :third then third(weekday)
      when :fourth then fourth(weekday)
      when :last then last(weekday)
    end
  end

  def teenth(weekday)
    13.upto(19) do |day|
      date = Date.new(@year, @month, day)
      return date if date.send weekday
    end
  end

  def first(weekday)
    1.upto(7) do |day|
      date = Date.new(@year, @month, day)
      return date if date.send weekday
    end
  end

  def second(weekday)
    8.upto(14) do |day|
      date = Date.new(@year, @month, day)
      return date if date.send weekday
    end
  end

  def third(weekday)
    15.upto(21) do |day|
      date = Date.new(@year, @month, day)
      return date if date.send weekday
    end
  end

  def fourth(weekday)
    22.upto(28) do |day|
      date = Date.new(@year, @month, day)
      return date if date.send weekday
    end
  end

  def last(weekday)
    31.downto(23) do |day|
      begin
        date = Date.new(@year, @month, day)
        return date if date.send weekday
      rescue ArgumentError
        next
      end
    end
  end
end

# p Meetup.new(5,2013).day(:monday, :teenth)
