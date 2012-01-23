require File.join(File.dirname(__FILE__), 'human')

class TargetNotSet < StandardError; end

class SpaceShip
  attr_accessor :target

  def fly
    raise TargetNotSet unless target.kind_of? String
    @location = target
  end

  def location
    @location || "Earth"
  end

  def take_a_pilot human
    human.yell("i'm in")
  end
end
