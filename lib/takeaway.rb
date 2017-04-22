require_relative "menu"

class Takeaway
  attr_reader :menu

  def initialize
    @menu = Menu.new
    @order = []
  end

  def view_menu
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:Dish]}, £#{item[:Price]}"
  end

  def select_item(number)
    @order << number
    puts "your order #{number} has been saved"
  end

  def checkout
    @order





end
