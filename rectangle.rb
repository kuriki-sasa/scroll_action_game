# -*- coding: utf-8 -*-
class Rectangle
  attr_reader :top_left, :bottom_right

  def initialize(top_left, bottom_right)
    @top_left = top_left
    @bottom_right = bottom_right
  end

  def within?(coord)
    if (@top_left.x <= coord.x && coord.x <= @bottom_right.x &&
        @top_left.y <= coord.y && coord.y <= @bottom_right.y)
      return true
    else
      return false
    end
  end

  #座標を画面内の相対座標に変換
  def relative_coordinate(coord)
    relative_x = coord.x - @top_left.x
    relative_y = coord.y - @top_left.y
    if (relative_x >= 0 && relative_y >= 0)
      return Coordinate.new(relative_x, relative_y)
    end
  end

  def ==(other)
    other.same_area?(@top_left, @bottom_right)
  end

  protected
  def same_area?(top_left, bottom_right)
    return @top_left == top_left && @bottom_right == bottom_right
  end
end
