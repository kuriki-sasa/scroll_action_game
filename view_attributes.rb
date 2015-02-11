class ViewAttributes
  :backgroud_color
  :alpha
  :gravity

  :center_horizontal
  :right
  :left
  :center_vertical
  :top
  :bottom

  def initialize(attributes = {})
    @attributes = attributes
  end

  def add_attributes(attributes = {})
    @attributes.update(attributes)
  end
end
