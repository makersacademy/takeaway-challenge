class Takeaway

  def initialize
    @order_list = {}
  end

  def lets_eat
    puts ""
    puts "Here is the menu:"
    puts menu
    puts "Please select your first item".center(60)
    puts "To finish, just hit return twice".center(60)
    item = gets.chomp

    while !item.empty? do
      puts "How many?"
      quantity = gets.chomp.to_i
      order(item, quantity)
      puts "Anything else?".center(60)
      item = gets.chomp
    end

    puts "Please confirm how many items you have ordered:"
    item_confirm = gets.chomp.to_i
    confirm_total(item_confirm)
  end

  def menu
    @menu = { "Pizza" => 8, "Burger" => 5, "Chips" => 2, "Sushi" => 10, "Soft Drink" => 1, "Beer" => 3}
  end

  def order(item, quantity)
    @order_list[item]=quantity
  end

  def order_list
    @order_list
  end

  def number_of_dishes
    order_list.inject(0) { |total, (key, value)| total + value}
  end

  def confirm_total(num)
    if num == number_of_dishes
      "Order confirmed!"
    else
      "Wrong number of dishes, please check your order"
    end
  end

end