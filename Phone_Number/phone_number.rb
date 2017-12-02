class PhoneNumber
  def initialize(number)
    @extra_letters = number.match(/[a-z]/) ? true : false
    @number = number.gsub(/[^0-9]/, '')
  end

  def number
    return '0' * 10 if invalid?
    if @number.size == 11 && @number[0] == '1'
      @number[0] = ''
    end
    @number
  end

  def area_code
    @number[0,3]
  end

  def invalid?
    return true if @extra_letters
    return true if @number.size == 11 && @number[0] != '1'
    @number.size < 10 || @number.size > 11
  end

  def to_s
    # calling self.number instead of @number directly since the method
    # checks for the numbers validity, additionally editing it for '1'
    "(#{self.number[0,3]}) #{self.number[3,3]}-#{self.number[6,4]}"
  end
end

# puts PhoneNumber.new('11234567890').to_s
