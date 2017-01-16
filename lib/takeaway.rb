require_relative 'list'
require_relative 'printer'
require_relative 'text'


class Takeaway

  attr_reader :user_order
  attr_accessor :total_price
  include Printer
  include Text

  def initialize(list)
    @menu = list.dish_list
    @user_order = Hash.new
    @total_price = nil
  end

  def show_list
    @menu
  end

  def order_meal(dish, quantity)
      raise "Item not in list" unless @menu.has_key?(dish)
        user_order[dish] = [quantity, @menu[dish]]
  end

end
