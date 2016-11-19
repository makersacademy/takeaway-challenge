require_relative 'menu'

class Interface

  def initialize(name, menu)
    @menu = menu.new
    @name = name
  end

  def welcome
    print "Welcome to #{name}, if you are hungry you came to the right place!"
  end

  private
  attr_reader :name

end
