require_relative 'menu'

class Order

  def initialize
    @menu_options = [
      "1. Chips Price £1.00",
      "2. Cheese Burger Price: £2.50",
      "3. Hot Dog Price: £2.00",
      "4. Chilli Dog Price: £3.50",
      "5. Can of drink Price: £0.50"]
    @menu_prices = [1.00, 2.50, 2.00, 3.50, 0.50]
    @order = []
    @total_price = []
  end

  def place_an_order
    order_intro
    order_loop
    order_confirmation
  end

  def order_intro
    puts "What would you like to order?"
    puts "To finish your order, hit return twice"
    @order_number = gets.chomp
  end

  def order_loop
    until @order_number.empty? do
      final_order_process
      order_intro
    end
  end

  def order_selection
    @selection = @order_number.to_i
    puts "You selected " + @menu_options[@selection - 1].to_s
  end

  def order_amount
    puts "How many of this item would you like to order?"
    @amount = gets.chomp
    @amount_num = @amount.to_i
    puts "#{@amount} have been added to your order."
  end

  def order_amount_added_to_array
    @amount_num.times { @order.push(@menu_options[@selection - 1]) }
    @amount_num.times { @total_price.push(@menu_prices[@selection - 1]) }
  end

  def final_order_process
    order_selection
    order_amount
    order_amount_added_to_array
  end

  def order_confirmation
    puts "You have ordered"
    puts @order
    puts "Your total is £" + sprintf('%.2f', @total_price.inject(0, :+).to_s)
    puts "You will now be returned back to the main menu."
  end

end
