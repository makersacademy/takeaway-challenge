class Order

  attr_reader :order_list

  def initialize(dish_class = Dish, calc_class = Calculator, sms_class = Messenger)
    @order_list = []
    @dish_class = dish_class
    @calc_class = calc_class
    @sms_class = sms_class
  end

  def order(menu, dish)
    item = menu.check(dish)
    if item != nil
      @order_list << item
      puts "#{render_name(item.name)} added to your basket"
    else
      raise AvailabilityError
    end
  end

  def basket_summary
    puts "Dishes: "
    @order_list.each do |item|
      puts "#{render_name(item.name)}: £#{item.price}"
    end
    puts "Total: £#{total_price}"
  end

  def place_order
    basket_summary
    order_list.clear
    sms.send_text
  end

  private 

  def total_price
    prices = @order_list.map { |dish| dish.price }
    calc = @calc_class.new
    calc.total(prices)
  end

  def render_name(name)
    name.capitalize.gsub('_', ' ')
  end

end
