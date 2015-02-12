require_relative 'layout'
require_relative 'coordinate'

class LinearLayout < Layout
  def layout_subviews
    case orientation
    when :vertical   then layout_subviews_vertically
    when :horizontal then layout_subviews_horizontally
    else
      raise "Unkonow orientation! : #{orientation}"
    end
  end

  private
  def layout_subviews_horizontally
    return if @subviews.empty?
    origin_x = padding_left
    origin_y = origin_y_of_subview_in_horizontal_layout + padding_top
    @subviews.each do |subview|
      subview.set_origin(Coordinate.new(origin_x, origin_y))
      origin_x = origin_x + (subview.margin_left + subview.width + subview.margin_right)
    end
  end

  def layout_subviews_vertically
    return if @subviews.empty?
    origin_x = origin_x_of_subview_in_vertical_layout + padding_left
    origin_y = padding_top
    @subviews.each do |subview|
      subview.set_origin(Coordinate.new(origin_x, origin_y))
      origin_y = origin_y + (subview.margin_top + subview.height + subview.margin_bottom)
    end
  end

  def origin_y_of_subview_in_horizontal_layout
    if gravity.include?(:top)
      return 0
    elsif gravity.include?(:bottom)
      return @height - @subviews.first.height
    elsif gravity.include?(:center_vertical)
      return (@height - @subviews.first.height) / 2
    end
  end

  def origin_x_of_subview_in_vertical_layout
    if gravity.include?(:left)
      return 0
    elsif gravity.include?(:right)
      return @width - @subviews.first.width
    elsif gravity.include?(:center_horizontal)
      return (@width - @subviews.first.width) / 2
    end
  end

  def orientation
    return @attributes.fetch(:orientation, :vertical)
  end
end
