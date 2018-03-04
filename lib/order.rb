require_relative './menu.rb'

class Order

  attr_reader :user_order, :menu, :tot

  def initialize(menu = Menu.new)
    @user_order = []
    @menu = menu
    @list = menu.generate_menu
  end

  def display_menu
    @menu.display
  end

  def add_to_order(quantity, dish)
    return "Quantity must be an integer." unless quantity.is_a? Integer
    return "Dish must be in the menu." unless available?(dish)
    @user_order << [quantity, dish]
  end

  def available?(dish)
    return false unless dish.is_a?(Dish)
    @list.each do |item|
      return true if (item.name == dish.name) and (item.price == dish.price)
    end
    return false
  end

  def calculate_payment
    @tot = 0
    @user_order.each { |item| @tot += item.last.price * item.first }
    @tot
  end

  def show_bill
    return "You did not order anything" if @user_order == []
    dishes = "You ordered:\n"
    @user_order.each { |item|
      item.last.name[0] = ''
      dishes << item.last.name + " x " + item.first.to_s + " \n"
    }
    calculate_payment
    dishes << "TOTAL: #{@tot} £"
    puts dishes
  end

end
