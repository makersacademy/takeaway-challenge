require_relative 'order'
require_relative 'menu'
require_relative 'text'
require 'rubygems'
require 'twilio-ruby'

class Restaurant

  attr_reader :name, :menu

  def initialize(name)
    @name = name
  end

  def create_menu(filename)
    @menu = Menu.new(filename)
  end

  def display_menu
    @menu ? @menu.print : "No menu exists. Please contact the restaurant"
  end

  def create_order
    @order = Order.new(@menu.format_menu)
  end

  def display_order
    @order.display_order_summary
  end

  def complete_order(total_price, phone_number)
    Text.new.confirmation(total_price, phone_number)
  end

end
