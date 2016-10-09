require_relative 'order'
require_relative 'menu'
require 'csv'

class Customer

  attr_reader :menu
  attr_accessor :new_order, :pending_order, :selection

  def initialize
    @pending_order = []
    @menu = Menu.new
    @new_order = nil
    @selection = selection
  end

  def new_order
    puts "Please enter a menu choice:"
    @selection = gets.chomp.to_i
    create_order(@selection)
  end

  def create_order(selection)
    @pending_order << @menu.menu[selection]
  end

  def confirm_order
    @new_order = Order.new(@pending_order)
  end
end
