#################################################
# KeyEventDispatcher
#################################################

require 'singleton'
require_relative 'listenable'

class KeyEventDispatcher
  include Singleton
  include Listenable

  def dispatch_key_event(action, key)
    func = nil
    case action
    when :press   then func = :did_pressed_key
    when :release then func = :did_released_key
    when :tap     then func = :did_tapped_key
    else
      raise "Unkonow action! action : #{action}  key : #{key}"
    end
    self.fire(func, key)
  end
end

class KeyEventListener
  def did_pressed_key(key_code)
  end

  def did_released_key(key_code)
  end

  def did_tapped_key(key_code)
  end
end
