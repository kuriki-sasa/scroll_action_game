# -*- coding: utf-8 -*-
#############################
#= Listenerの仕組みを提供する
#############################

module Listenable
  def add_listener(listener)
    p listener
    @listeners = Array.new unless defined? @listeners
    return false if @listeners.include?(listener)
    @listeners.push(listener)
    return true
  end

  def remove_listener(listener)
    @listeners.delete(listener) if defined? @listeners
  end

  def fire(func, *arg)
    return nil unless defined? @listeners
    # リスナーのメソッドを呼び出し
    @listeners.each do |listener|
      unless listener.respond_to? func
        raise NoMethodError, "listener does not respond to `#{func.to_s}'"
      end
      listener.send(func, *arg)
    end
  end
end
