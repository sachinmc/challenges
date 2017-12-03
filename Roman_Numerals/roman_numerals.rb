# http://www.novaroma.org/via_romana/numbers.html

class Integer
  # ROMAN = {'M'=> 1000, 'D'=> 500, 'C'=> 100, 'L'=> 50, 'X'=> 10 } #, 'V'=> 5, 'I'=> 1}
#  ONE_TO_NINE = {''=> 0, 'I'=> 1, 'II' => 2, 'III' => 3, 'IV' => 4, 'V' => 5, 'VI' => 6,
#                  'VII'=> 7, 'VIII'=> 8, 'IX'=> 9}

  ROMAN = { 'M' => 1000, 'CM' => 900, 'D'=> 500, 'CD' => 400,
            'C' => 100, 'XC' => 90, 'L'=> 50, 'XL' => 40, 'X' => 10,
            'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }

  def to_roman#(num)
    result = ''
    remainder = self # num
    ROMAN.each do |key, val|
      quotient, remainder = remainder.divmod(val)
      next if quotient == 0
      result += key * quotient
    end
    result
  end
end

class RomanNumerals < Integer
end
