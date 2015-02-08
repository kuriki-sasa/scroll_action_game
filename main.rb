require "starruby"
require_relative 'key_event_dispatcher'
require_relative 'key_input_observer'
require_relative 'view'

include StarRuby

class TestListener < KeyEventListener
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
  view = View.new(50, 50)
  sub_view = View.new(10, 10, Color.new(0, 0, 0))
  view.add_sub_view(sub_view)
  view.render(game.screen)
end
