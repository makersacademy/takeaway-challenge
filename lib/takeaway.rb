require_relative "menu.rb"
require_relative "calculator.rb"
require_relative "sms_texter.rb"

class Takeaway
  
  def initialize(menu: Menu.new, sms_texter: SmsTexter.new)
    @menu = menu
    @order = {}
    @sms_texter = sms_texter
  end

  def add(item, quantity = 1)
    item = item.to_sym
    raise "Item not in menu, please check spelling" unless @menu.dishes.key?(item)
    iterate_through_order(item, quantity)
  end

  def show_menu
    @menu.dishes
  end

  def order
    @order
  end

  # would be better if shortened, any suggestions?
  def basket(dishes = @menu.dishes)
    input = Calculator.current_basket(@order, dishes)
    output = []
    input.each do |item|
      output.push("#{item.values[0]} x#{item.values[1]} = £#{item.values[2]}")
    end
    output.join(", ")
  end

  def total
    Calculator.current_basket(@order, @menu.dishes)
    total = Calculator.total
    "Total: £#{total}"
  end

  def checkout(amount)
    Calculator.current_basket(@order, @menu.dishes)
    total = Calculator.total
    raise "The amount you have entered does not equal the order total, please consider checking amount to be paid using .total" if amount < total
    @sms_texter.send_sms
    "Your payment of #{amount} has been made, thank you for your order"
  end

  private

  def iterate_through_order(item, quantity)
    @order.key?(item) ? iterate_and_update(item, quantity) : @order[item] = quantity
    @order
  end

  def iterate_and_update(item, quantity)
    @order.each do |key, value|
      @order[item] = value + quantity if item == key
    end
  end


end