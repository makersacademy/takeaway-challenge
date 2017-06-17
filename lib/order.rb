require_relative './menu.rb'

class Order

  attr_reader :entries, :menu

  def initialize(menu)
    @entries = []
    @menu = menu
  end
end
