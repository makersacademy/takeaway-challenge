require_relative 'sendsms'

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = Hash.new(0)
    @menu = Menu.new
  end

  def add_to_basket(item, quantity)
    raise "Item not in menu" unless menu.items.include?(item)
    basket[item] += quantity
    print_order(item, quantity)
  end

  def print_summary
    order_summary + ": Total = £" + total_bill.to_s
  end

  def place_order
    SendSMS.new(print_summary)
  end


  private

  def print_order(item,quantity)
    "#{quantity} x #{item} added to your basket"
  end

  def order_summary
    summary = basket.map { | item, quantity |
      "#{quantity} x #{item} = £#{(menu.items[item] * quantity)}"}.join(', ')
  end

  def total_bill
    basket.map { | item, quantity| menu.items[item] * quantity }.reduce(:+)
  end

end
