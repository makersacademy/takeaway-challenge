require_relative 'menu.rb'

class Customer

  attr_writer :menu, :order

  def initialize
    @menu =   { "crispy chilli beef" => 5.99,
          "sweet and sour chicken" => 4.99,
          "egg fried rice" => 2.99 }
    @order = []
  end

  def display_menu
    @menu.each { |key, value| "#{key}, £#{value}" }
  end

  def choose_dish(dish)
    fail "This dish is not on the menu" unless @menu.has_key?(dish)
    @order << dish
  end

  def view_order
    @order
  end
end
