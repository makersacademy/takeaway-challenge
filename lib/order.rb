require_relative 'menu'


class Order

  #attr_reader :menu, :list_of_dishes, :order_amount, :ordered_dish_number, :price, :name

  def initialize
    @list_of_dishes = []
    @order_amount = 0
    @menu = Menu.new
    see_menu
  end

  def see_menu
    puts "Would you like to look at the menu?"
    answer = gets.chomp
    case answer
    when "yes"
    @menu.print_menu
    ask_if_want_to_order
    when "no"
    ask_if_want_to_order
    else
    puts "This is not a valide choice, type 'yes' or 'no'"
    see_menu
    end
  end

  def ask_if_want_to_order
    puts "Would you like to order a dish?"
    order = gets.chomp.downcase
    order == "yes" ? ask_if_sms_order : exit
  end

  def ask_if_sms_order
    puts "Would you like to order via sms?"
    answer = gets.chomp.downcase
    if answer == "yes" then sms_order elsif answer == "no" then ask_for_order
    else
       not_a_valid_choice
       ask_if_sms_order
    end
  end

  def sms_order
    puts "Please send an sms message to : +441344231766, with the dish(es) number(s) and quantity.\n
    If you are not registerd with us, please send as well your full name and delivery adress.\n
    Thank you"
    exit
  end

  def ask_for_order
      puts "Please enter the dish number you wish to order"
      @ordered_dish_number = gets.chomp.to_i
      if @menu.valid_dish_number(@ordered_dish_number) == nil
        puts "This is not valid dish number"
        ask_for_order
      else
        puts "How many of this dish do you wish to order?"
        @quantity = gets.chomp.to_i
        retrieve_dish_from_menu
        ask_for_further_dish
      end
  end

  def retrieve_dish_from_menu
    dish = @menu.select_a_dish(@ordered_dish_number)
    dish[:quantity] = @quantity
    dish[:total] = @quantity * (dish[:price])
    add_dish_to_order(dish)
  end

  def add_dish_to_order(dish)
    @list_of_dishes << dish
    set_to_nil
  end

  def ask_for_further_dish
      puts "Would you like to order an other dish?"
      answer = gets.chomp.downcase
      while answer == "yes"
      ask_for_order
      end
      if answer == "no" then summary
      else
      not_a_valid_choice
      ask_for_further_dish
      end
  end

  def confirm
    puts "Would you like to confirm this order?"
    confirm = gets.chomp.downcase
    if confirm == "yes" then send_sms elsif confirm == "no" then exit
    else
       not_a_valid_choice
       confirm
    end
  end

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

    def not_a_valid_choice
      puts "This is not a valide choice, type 'yes' or 'no'"
    end

  private :summary, :total_amount, :send_sms, :retrieve_dish_from_menu, :add_dish_to_order, :not_a_valid_choice
end
