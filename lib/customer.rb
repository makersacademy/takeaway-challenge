require_relative 'order'
require_relative 'menu'
require_relative 'confirmation_text_sender'
require 'csv'

class Customer

  attr_reader :menu
  attr_accessor :order_created, :pending_order, :selection

  def initialize()
    @pending_order = []
    @menu = Menu.new
    @order_created = nil
    @selection = selection
  end

  def select_dish
    puts "Please enter a menu choice:"
    selection = gets.chomp.to_i
    add_to_order(selection)
  end

  def confirm_order
    @order_created = Order.new(pending_order)
    @order_created.confirm_order
  end

  private

  def add_to_order(selection)
    pending_order << @menu.menu[selection]
  end
end
