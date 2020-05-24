require 'csv'

class Order
  def initialize
    @customer_order = {}
  end

  def request_order
    request_dish
    until @dish_order.empty?
      request_quantity
      confirm_order
      request_dish
    end
  end

  private

  def menu_data
    load_data('../menu.csv')
  end

  def request_dish
    puts 'Please enter the dish name:'
    puts '[to finish, hit Return]'
    @dish_order = recieve_user_input('dish')
  end

  def request_quantity
    puts 'Please enter the quantity:'
    @dish_quantity = recieve_user_input('quantity')
  end

  def recieve_user_input(type)
    input = gets.chomp
    until input_valid?(input, type)
      invalid_entry_error
      input = gets.chomp
    end
    input
  end

  def input_valid?(input, type)
    case type
    when 'quantity'
      input.gsub(/[0-9]/, "").empty? && !input.empty?
    when 'dish'
      menu_data.keys.include?(input.downcase) || input.empty?
    end
  end

  def invalid_entry_error
    puts "Invalid entry, please try again:"
  end

  def confirm_order
    puts "-- #{@dish_quantity} #{@dish_order}(s) added! --\n\n"
  end

  def load_data(file_path)
    data = {}
    CSV.foreach(file_path) do |line|
      dish, price = line
      data[dish] = price
    end
    data
  end
end
