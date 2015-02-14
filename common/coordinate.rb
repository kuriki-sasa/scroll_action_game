# -*- coding: utf-8 -*-
class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    return other.same_position?(@x, @y)
  end

  protected
  def same_position?(x, y)
    return @x == x && @y == y
  end
end
