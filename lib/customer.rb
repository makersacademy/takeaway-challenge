require_relative 'menu.rb'

class Customer

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
  end
