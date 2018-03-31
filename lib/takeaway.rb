class Takeaway
  attr_reader :my_order, :list
  def initialize
    @my_order = Hash.new(0)
    @total = 0.00
    @list = []
  end

  def view_menu
    {"Margharita"=> 7.00, "Pepperoni"=> 7.50, "Ham & Pineapple"=> 7.50, "Vegetarian"=> 7.00, "Meat Feast"=> 8.00}
  end

  def add_item(item, quantity = 1)
    raise "Sorry, that is not available on the menu" unless view_menu.include?(item)
    @my_order[item] += quantity
  end

  def remove_item(item, quantity = 1)
    raise "Sorry, the item selected is not in your order" unless @my_order.include?(item)
    raise "Sorry, you can't remove more than you've ordered" if my_order[item] < quantity
    @my_order[item] -= quantity
  end

  def order_total
    @my_order.each { |item, quantity| @total += (view_menu[item] * quantity ) }
  end

  def item_total(item, quantity)
    view_menu[item] * (quantity)
  end


  def display_order
    @my_order.each do |item, quantity|
      @list << "#{item} x#{quantity} = £#{'%.2f' % (item_total(item, quantity))}"
    end
    p @list.join(", ")
  end
end
