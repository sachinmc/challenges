# circular buffer of fixed size - it starts empty with predefined length

# buffer_write
# write or add more elements, gets appended after the previous elements

# buffer_read
# read or remove oldest elements

# buffer is full, error will be raised

# forced_write
# elements added and they will overwrite oldest data
require 'pry'
class CircularBuffer

  def initialize(size)
    @buffer = Array.new(size)
    @read_idx = 0
    @write_idx = 0
    @full_write_idx = 0
    @read_count = 0
  end

  def read
    read_return = @buffer[@read_idx]
    if @read_count >= @buffer.size || read_return == nil
      raise BufferEmptyException
    end
    @read_idx += 1
    @read_count += 1
    if @read_count < @buffer.size && @read_idx >= @buffer.size
      @read_idx = 0
    end
    read_return
  end

  def write(ele)
    return if ele == nil
    raise BufferFullException if @buffer.none?(&:nil?)
    @buffer[@write_idx] = ele
    @write_idx += 1
  end

  def write!(ele)
    return if ele == nil
    if @buffer.none?(&:nil?)
      @buffer[@full_write_idx] = ele
      @full_write_idx += 1
      @read_idx += 1
    else
      write(ele)
    end
  end

  def clear
    (0...@buffer.size).each do |n|
      @buffer[n] = nil unless @buffer[n] == nil
    end
    @read_idx = 0
    @write_idx = 0
    @full_write_idx = 0
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end



# buffer = CircularBuffer.new(2)
# buffer.write '1'
# buffer.write '2'
# p buffer
# buffer.write! 'A'
# p buffer
# binding.pry
# p buffer.read
# p buffer.read
# buffer.read

# buffer = CircularBuffer.new(2)
# buffer.write '1'
# buffer.write '2'
# p buffer
# buffer.write 'A'


# buffer = CircularBuffer.new(3)
# ('1'..'3').each { |i| buffer.write i }
# p buffer
# buffer.clear
# p buffer
# buffer.write '1'
# buffer.write '2'
# p buffer
# p buffer.read
# buffer.write '3'
# p buffer.read

# buffer = CircularBuffer.new(5)
# buffer.write 1
# buffer.write 2
# p buffer
# p buffer.read
# p buffer.read


# CircularBuffer.new(5).read

# buffer =  CircularBuffer.new(5)
# 1.upto(7) do |n|
#   buffer.write(n)
# end
# buffer.write(10)
# buffer.write(11)
# p buffer
# 1.upto(7) do
#   buffer.read
# end
# # binding.pry
# p buffer.read
# p buffer.read
# p buffer.read
# p buffer.read
