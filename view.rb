require_relative 'coordinate.rb'

class View
  attr_reader :width, :height

  def initialize(width, height, attributes = {})
    @width = width
    @height = height
    @attributes = attributes

    @texture = initialize_texture(width, height, attributes)
    @subviews = Array.new
    @origin = Coordinate.new(0, 0)
  end

  def render(parent_texture)
    render_subviews
    parent_texture.render_texture(@texture, @origin.x, @origin.y, render_options)
  end

  def add_subview(view)
    @subviews.push(view)
    layout_subviews
  end

  def remove_subview(view)
    @subviews.delete(view)
    layout_subviews
  end

  def layout_subviews
  end

  def render_subviews
    return if @subviews.empty?
    @subviews.each do |subview|
      subview.render(@texture)
    end
  end

  protected
  def set_origin(origin)
    @origin = origin
  end

  def margin
    return @attributes.fetch(:margin, {:margin_top => margin_top, :margin_bottom => margin_bottom, :margin_left => margin_left, :margin_right => margin_right})
  end

  def margin_top
    return @attributes.fetch(:margin_top, 0)
  end

  def margin_bottom
    return @attributes.fetch(:margin_bottom, 0)
  end

  def margin_left
    return @attributes.fetch(:margin_left, 0)
  end

  def margin_right
    return @attributes.fetch(:margin_right, 0)
  end

  private
  def initialize_texture(width, height, attributes={})
    texture = Texture.new(width, height)
    texture.fill(attributes.fetch(:backgroud_color, Color.black))
    return texture
  end

  def render_options
    return {:alpha => alpha}
  end

  def tag
    return @attributes.fetch(:tag, nil)
  end

  def alpha
    return @attributes.fetch(:alpha, 255)
  end

  def padding
    return @attributes.fetch(:padding, {:padding_top => padding_top, :padding_bottom => padding_bottom, :padding_left => padding_left, :padding_right => padding_right})
  end

  def padding_top
    return @attributes.fetch(:padding_top, 0)
  end

  def padding_bottom
    return @attributes.fetch(:padding_bottom, 0)
  end

  def padding_right
    return @attributes.fetch(:padding_right, 0)
  end

  def padding_left
    return @attributes.fetch(:padding_left, 0)
  end
end
