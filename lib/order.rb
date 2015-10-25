class Order

  attr_reader :basket, :total, :menu

  def initialize
    @basket = Hash.new(0)
    @total = 0
    @menu = Menu.new
  end

  def add_to_basket(item, quantity)
    raise "Item not in menu" unless menu.items.include?(item)
    basket[item] += quantity
    "#{quantity} x #{item} added to your basket"
  end

  def order_summary
    summary = basket.map { | item, quantity |
    "#{quantity} x #{item} = £#{(menu.items[item] * quantity)}"}.join(', ')
    summary + ": Total = £" + total_bill.to_s
  end

  private
  def total_bill
    basket.map { | item, quantity| menu.items[item] * quantity }.reduce(:+)
  end
end
