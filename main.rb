require "starruby"
require_relative 'key_event_dispatcher'
require_relative 'key_input_observer'
require_relative 'view'
require_relative 'view_attributes'
require_relative 'linear_layout'
require_relative 'color'

include StarRuby

class TestListener
  include KeyEventListener
  def did_pressed_key(key)
    p "press #{key}"
  end

  def did_released_key(key)
    p "release #{key}"
  end
end

class Test
  def initialize(num)
    @num = num
  end

  def ==(other)
    return other.equivalence?(@num)
  end

  protected
  def equivalence?(other_num)
    return @num == other_num
  end
end

test_listener = TestListener.new
KeyEventDispatcher.instance.add_listener(test_listener)

Game.run(640, 480) do |game|
  game.screen.clear
  KeyInputObserver.instance.check_key_input
  view = View.new(50, 50, :backgroud_color => Color.green)
  layout = LinearLayout.new(30, 30, :orientation => :vertical ,:backgroud_color => Color.blue, :padding_top => 5, :padding_left => 5)
  subview = View.new(10, 10, :backgroud_color => Color.red, :margin_top => 1)
  subview2 = View.new(10, 10, :backgroud_color => Color.red, :margin_top => 1)
  layout.add_subview(subview)
  layout.add_subview(subview2)
  view.add_subview(layout)
  view.render(game.screen)
end
