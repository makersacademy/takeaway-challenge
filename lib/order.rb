class Order

  def initialize
    @customer_order = {}
  end

  def request_order
    request_dish
    while !@dish_order.empty?
      request_quantity
      confirm_order
      request_dish
    end
  end

  private

  def request_dish
    puts 'Please enter the dish name:'
    puts '[to finish, hit Return twice]'
    input = gets.chomp
    @dish_order = input
  end

  def request_quantity
    puts 'Please enter the quantity:'
    input = gets.chomp
    while !quantity_valid?(input)
      invalid_entry_error
      input = gets.chomp
    end
    @dish_quantity = input
  end

  def quantity_valid?(input)
    input.gsub(/[0-9]/,"").empty? && !input.empty?
  end

  def invalid_entry_error
    puts "Invalid entry, please try again:"
  end

  def confirm_order
    puts "-- #{@dish_quantity} #{@dish_order}(s) added! --"
  end


end

