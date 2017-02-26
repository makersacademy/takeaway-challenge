require_relative 'menu'

class Order

  attr_reader :selection, :menu, :prices, :total, :orders, :confirmation

  def initialize(menu = Menu.new)
  @menu = menu
  @orders = []
  @selection = {}
  @prices = []
  end

  def start
    puts @menu.introduction
    puts @menu.show_menu
  end

  def select_order(item, amount)
    @selection = { item.to_sym => amount}
    add_to_orders
    return "#{amount} x #{item} added to your order!"
  end

  def add_to_orders
    @orders << @selection
  end

  def get_price
    @orders.each do |dishes|
      dishes.each do |item, amount|
        @price = menu.dishes[amount]
    puts "#{amount} x #{item.to_sym} at £#{@price} = (£#{@price *= amount})"
      @prices << @price
    end
  end
end

  def calculate_price
    puts get_price
    total_price
    puts display_total_price
    puts confirm_alert
  end

  private

  def is_correct_amount?(price)
    total_price == price
  end


  def confirm_alert
    "The total order will be scheduled for delivery. Do you wish to continue?"
  end
  #
  # <<<<<< HEAD
  #   def confirm(answer, confirmation = Confirmation.new)
  #     raise "Your order was cancelled" if answer.downcase != "yes"
  #     @confirmation = confirmation
  # ------
  #   def confirm(answer)
  #     raise "Your order was cancelled" if answer.downcase != "yes"
  #     Confirmation.new
  # end

end
