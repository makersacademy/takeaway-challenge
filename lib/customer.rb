require_relative '../lib/menu'

class Customer

  BASKET = Array.new
  MENU = Menu.new

  attr_reader :basket, :menu

  def initialize
    @basket = BASKET
    @menu = MENU
  end

  def list_menu
    return @menu.view
  end

  def order
    inital_order = true
    item = nil
    until item == :complete
      if inital_order == true
        puts "What would you like to order ?"
        item = gets.chomp.to_sym
        @basket << item
        inital_order = false
      else
        puts "Would you like to add anything else to your order ? "
        item = gets.chomp.to_sym
        @basket << item
      end
    end
  end

  def show_basket
    @basket.delete(:complete)
    @basket.each { |item| puts "#{item} will be #{@menu.OPTIONS[item.to_sym]}" }
  end

end