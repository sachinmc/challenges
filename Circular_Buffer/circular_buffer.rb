class CircularBuffer

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    raise BufferEmptyException if empty_buffer?
    @buffer.shift
  end

  def write(ele)
    return if ele.nil?
    raise BufferFullException if full_buffer?
    @buffer.push(ele)
  end

  def write!(ele)
    if full_buffer?
      return if ele.nil?
      @buffer.shift
      @buffer.push(ele)
    else
      write ele
    end
  end

  def empty_buffer?
    @buffer == []
  end

  def full_buffer?
    @buffer.size == @size
  end

  def clear
    @buffer.clear
  end
end
