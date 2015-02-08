require 'singleton'

class ViewRenderer
  include Singleton

  def initialize
    @views = Array.new
  end


end
