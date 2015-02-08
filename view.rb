require_relative 'coordinate.rb'

class View
  def initialize(width, height, backgroud_color = Color.new(255, 255, 255), alpha = 255)
    @texture = init_texture(width, height, backgroud_color)
    @sub_views = Array.new
    @alpha = alpha
    @origin = Coordinate.new(0, 0)
  end

  def render(parent_texture)
    render_sub_views
    parent_texture.render_texture(@texture, @origin.x, @origin.y, options)
  end

  def add_sub_view(view)
    @sub_views = Array.new unless defined? @sub_views
    @sub_views.push(view)
  end

  def layout_sub_views
    @sub_views.each do |sub_view|
    end
  end

  def render_sub_views
    @sub_views.each do |sub_view|
      sub_view.render(@texture)
    end
  end

  private
  def init_texture(width, height, backgroud_color)
    texture = Texture.new(width, height)
    texture.fill(backgroud_color)
    return texture
  end

  def options
    return {:alpha => @alpha}
  end
end
