class Clock
  attr_reader :hr
  attr_accessor :min

  def initialize(hr, min)
    @hr = hr
    @min = min
  end

  def self.at(hr, min = 0)
    Clock.new(hr, min)
  end

  def +(minutes)
    self.min = min + minutes
    forward_an_hour if min > 60
    self
  end

  def forward_an_hour
    @hr == 23 ? @hr = 0 : @hr += 1
    @min -= 60
    forward_an_hour if @min > 60
  end

#  def -(minutes)
#    hr, min = minutes.divmod(60)
#    @hr == 0 ? @hr = 23 : @hr -= 1
#    @min -= min
#    if @min < 0
#      @hr -= 1
#      @min = @min.abs
#    end
#    self
#  end

  def -(minutes)
    # preserve the -ve sign since it indicates backward travel
    self.min = min - minutes
    backward_an_hour if min < 0
    self
  end

  def backward_an_hour
    @hr == 0 ? @hr = 23 : @hr -= 1
    @min += 60 #substracting hrs by adding to -ve number 
    backward_an_hour if @min < 0
  end

  def ==(other)
    self.hr == other.hr && self.min == other.min
  end

  def to_s
    format('%.2d:%.2d', hr, min)
  end
end

clock = Clock.at(10) - 5
p clock.to_s
