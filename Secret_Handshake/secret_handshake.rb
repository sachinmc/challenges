# input - decimal number
# output - sequence of events for a secret handshake

# decimal to binary
# factorise binary based on code
# 1
# 10
# 100
# 1000

# handshake:
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


class SecretHandshake
  def initialize(number)
    @decimal = number.to_i
    @reverse = false
  end

  def decimal_to_binary(decimal)
    quotient = decimal
    binary = []
    loop do
      break if quotient == 0
      quotient, remainder = quotient.divmod(2)
      binary.unshift(remainder.to_s)
    end
    binary.join.to_i
  end

  def commands
    binary = decimal_to_binary(@decimal)
    handshake = {10_000 => '', 1000 => 'jump', 100 => 'close your eyes',
                 10 => 'double blink', 1 => 'wink'}
    result = []
    remainder = binary
    handshake.keys.each do |hs|
      quotient, remainder = remainder.divmod(hs)
      @reverse = true if hs === 10_000 && quotient >= 1
      result.unshift(handshake[hs]) if quotient == 1 && hs != 10_000
    end
    reverse? ? result.reverse : result
  end

  def reverse?
    @reverse
  end
end

# p SecretHandshake.new(31).commands
# p SecretHandshake.new(0).commands
