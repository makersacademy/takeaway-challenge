class Order


  def initialize
  end

  def order_number
    rand(4563..4985)
  end


  def order_selection
    puts "please make your order in the following format"
    puts
    puts "quantity followed by item, followed by 'order total:'"
    puts "e.g., - 1 Garlic Bread, 1 Margherita, order total: 13"
    @order = gets.chomp

  end

  def cost_calculation

  end




end
