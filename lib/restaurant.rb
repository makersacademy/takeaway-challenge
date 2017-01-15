class Restaurant

  attr_reader :menu, :order, :count

  def initialize

    @menu = [{"fried rice" => "5 Pounds"}, {"beef-stew" => "4 Pounds"}]
    @order =[]
    @count = 0

  end

  def display_menu

    p menu

  end

  def order_items(item,number)
    order << {dish: item, size: number}
  end

  def finish_order(total)
    order.each do |items| items.each do |k,v| @count += v.to_i end end
    raise "the total given does not equal the dishes ordered" if total != count
    puts "you have ordered #{count} dishes"
  end


end
