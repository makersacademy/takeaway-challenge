require_relative 'menu'


class Order

  attr_reader :menu, :list_of_dishes, :order_amount, :ordered_dish_number, :price, :name

  def initialize
    @list_of_dishes = []
    @order_amount = 0
    @menu = Menu.new
    see_menu
  end

  def see_menu
    puts "Would you like to look at the menu?"
    @menu.print_menu if gets.chomp.downcase == "yes"
    ask_if_want_to_order
  end

  def ask_if_want_to_order
    puts "Would you like to order a dish?"
    order = gets.chomp.downcase
    ask_for_order if order == "yes"
  end

  def ask_for_order
      puts "Please enter the dish number you wish to order"
      @ordered_dish_number = gets.chomp.to_i
      puts "How many of this dish do you wish to order?"
      @quantity = gets.chomp.to_i
      retrieve_dish_from_menu
  end

  def retrieve_dish_from_menu
    dish_ordered = @menu.select_a_dish(@ordered_dish_number)
    dish_ordered[:quantity] = @quantity
    dish_ordered[:total] = @quantity * (dish_ordered[:price])
    @list_of_dishes << dish_ordered
    set_to_nil
  end

  def ask_for_further_dish
      puts "Would you like to order an other dish?"
      other_order = gets.chomp.downcase
      while other_order == "yes"
      ask_for_order
      end
      summary
  end

  def confirm
    puts "Would you like to confirm this order?"
    confirm = gets.chomp.downcase
    confirm == "yes" ? send_sms : exit
  end

  private

    def set_to_nil
        @ordered_dish_number = nil; @quantity = nil
        ask_for_further_dish
    end

    def summary
      summary = ""
      @list_of_dishes.each { |dish| summary << "#{dish[:quantity]} #{dish[:dish]}(s), £#{(dish[:price]) * (dish[:quantity])} \n"}
      puts "Your order is: \n" + summary + "For a total of £#{total_amount}"
      confirm
    end

    def total_amount
      array = @list_of_dishes.map{|x| x[:total]}
      array.inject(0, :+)
    end

    def send_sms
        require_relative 'send_sms'
        exit
    end
end
