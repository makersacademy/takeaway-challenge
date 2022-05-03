class TakeAway
  
  attr_reader :menu, :order, :take_away

  def initialize(menu = Menu.new, confirmation = Confirmation.new)
    @confirmation = confirmation
    @menu = menu
    @order = []
    @take_away = 0
    @total = 0
    @current_dish = []
  end

  def view_menu
    @menu.view
  end

  def add_dish(number, qty)
    fail "please enter a valid dish number" if @menu.existing_dish(number, qty) != true
    if duplicate_dish(number, qty) == true
      update_qty(number, qty)
    else
      @order << current_dish(number, qty)
    end
    dish_added_message(number, qty)
  end

  def view_basket
    @order.map { |dish| "#{dish[:qty]} x #{dish[:dish]} £#{dish[:price]}/each -> £#{dish[:subtotal]}" }
  end

  def order_total
    "Your order total is £#{total}"
  end

  def place_order
    @confirmation.send
  end

  private 

  def duplicate_dish(number, qty)
    @order.select { |dish| dish[:item] == number } != []
  end

  def update_qty(number, qty)
    @order.map { |dish| (dish[:qty] = (dish[:qty] + qty)) && (dish[:subtotal] = dish[:qty] * dish[:price]) if (dish[:item] == number) }
  end
  
  def current_dish(number, qty)
    (@menu.selection(number, qty).push(:qty => qty, :subtotal => sub_total(number, qty))).reduce(&:merge)
  end

  def dish_added_message(number, qty)
    (@menu.selection(number, qty)).map do |dish| 
      "#{qty} x #{dish[:dish]} £#{dish[:price]}/each, has been added to your order -> £#{(sub_total(number, qty))}"
    end
  end

  def sub_total(number, qty)
    sub_total = @menu.selection(number, qty) 
    sub_total.map { |item| item[:price] * qty }
  end

  def total
    @order.map { |item| (item[:subtotal]) }.flatten.sum
  end
end
