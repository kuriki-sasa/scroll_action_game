require_relative 'color'

class View
  def initialize(width, height, alpha = 255, backgroud_color = Color.new(255, 255, 255))
    @view = init_self_view()
    @sub_views = Array.new
  end

  def add_sub_view(view)
    @sub_views.push(view)
  end

  def render_view(parent_view)
    parent_view.
  end
  def layout_sub_views
  end

  def render_sub_views
  end

  private
  def init_self_view(width, height, backgroud_color)
    view = Texture.new(width, height)
    view.fill(backgroud_color)
    return view
  end


end
