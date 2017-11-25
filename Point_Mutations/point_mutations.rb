class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    idx = size = len = 0
    if @strand.size > distance.size
      len = distance.size
    else
      len = @strand.size
    end
    while idx < len
      size += 1 if @strand.chars[idx] != distance.chars[idx]
      idx += 1
    end
    size
  end
end
