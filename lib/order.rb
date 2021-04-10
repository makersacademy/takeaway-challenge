class Order
  attr_reader :order_list, :total, :menu

  def initialize(menu)
    @order_list = Hash.new(0)
    @total = 0
    @eta = nil
    @menu = menu
  end

  def add_to_order(item, number = 1)
    number.times { @order_list[item] += 1 }
    add_to_total(item, number)
  end

  def check_total
    str = "You have ordered:"
    @order_list.each { |item, count| str += " #{count} x #{item} (£#{look_up_price(item)} each)" }
    str += ". The total is £#{@total}."
  end

  private
  def look_up_price(item)
    @menu[item]
  end

  def add_to_total(item, number)
    number.times { @total += look_up_price(item) }
  end
end
