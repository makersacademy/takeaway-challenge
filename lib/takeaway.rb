require_relative './menu.rb'

class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = Menu.new(menu)
  end
end