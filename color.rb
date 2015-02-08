class Color
  MAX_ALPHA = 255
  MIN_ALPHA = 0

  def initialize(red, green, blue, alpha = MAX_ALPHA)
    @color = StarRuby::Color.new(red, green, blue, alpha)
  end

  def red
    return @color.red
  end

  def green
    return @color.green
  end

  def blue
    return @color.blue
  end

  def alpha
    return @color.alpha
  end

  def ==(other)
    return @color == other.@color
  end
end
