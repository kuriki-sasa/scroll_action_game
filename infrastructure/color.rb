require 'starruby'

include StarRuby

class Color
  def Color.white
    return Color.new(255, 255, 255)
  end

  def Color.black
    return Color.new(0, 0, 0)
  end

  def Color.red
    return Color.new(255, 0, 0)
  end

  def Color.green
    return Color.new(0, 255, 0)
  end

  def Color.blue
    return Color.new(0, 0, 255)
  end
end
