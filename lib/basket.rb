class Basket

  attr_reader :my_order, :list, :total

  def initialize
    @my_order = Hash.new(0)
    @list = []
  end

  def add_to_basket(item, quantity)
    @my_order[item] += quantity
  end

  def remove_from_basket(item, quantity)
    raise "Sorry, the item selected is not in your order" unless @my_order.include?(item)
    raise "Sorry, you can't remove more than you've ordered" if my_order[item] < quantity
    @my_order[item] -= quantity
  end



  def display_order(menu)
    raise "Your basket is empty" if @my_order.empty?
    @my_order.each do |item, quantity|
      @list << "#{item} pizza x#{quantity} = £#{'%.2f' % (menu.dishes[item]*quantity)}"
    end
    @list.join(", ")
  end

  def order_total(menu)
    @total = 0
    @my_order.each { |item, quantity| @total += ( menu.dishes[item] * quantity ) }
    @total
  end

  private

  # def item_total(item, quantity)
  #   view_menu[item] * (quantity)
  # end

end
