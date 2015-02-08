# -*- coding: utf-8 -*-
require 'singleton'
require_relative 'key_event_dispatcher'

class KeyInputObserver
  include Singleton

  def initialize
    @last_pressed_keys = current_pressed_keys
  end

  def check_key_input
    check_key_press
    check_key_release
    @last_pressed_keys = current_pressed_keys
  end

  private
  def check_key_press
    new_pressed_keys = current_pressed_keys.reject{|key| @last_pressed_keys.include?(key)}
    dispatch_key_press_events(new_pressed_keys)
  end

  def check_key_release
    released_keys = @last_pressed_keys.reject{|key| current_pressed_keys.include?(key)}
    dispatch_key_release_events(released_keys)
  end

  # pressイベントを発行
  def dispatch_key_press_events(pressed_keys)
    pressed_keys.each do |key|
      dispatch_key_press_event(key)
    end
  end

  def dispatch_key_press_event(pressed_key)
    dispatch_key_event(:press, pressed_key)
  end

  # releaseイベントを発行
  def dispatch_key_release_events(released_keys)
    released_keys.each do |key|
      dispatch_key_release_event(key)
    end
  end

  def dispatch_key_release_event(releasedd_key)
    dispatch_key_event(:release, releasedd_key)
  end

  # keyイベント発行
  def dispatch_key_event(action, key)
    dispatcher = KeyEventDispatcher.instance
    dispatcher.dispatch_key_event(action, key)
  end

  def current_pressed_keys
    device = current_input_device
    return Input.keys(device, options)
  end

  def current_input_device
    return :keyboard
  end

  def options
    return {:device_number => device_number, :duration => -1, :delay => -1, :interval => 0}
  end

  def device_number
    return nil if current_input_device != :gamepad
    return 0
  end
end
