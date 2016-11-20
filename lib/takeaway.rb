class TakeAway

  def initialize
    @menu = default_menu
    @basket = Basket.new
  end

  def default_menu
    menu = Menu.new
    menu.add(Dish.new("spring roll" , 0.99))
    menu.add(Dish.new("char sui bun" , 3.99))
    menu.add(Dish.new("pork dumpling" , 2.99))
    menu.add(Dish.new("peking duck" , 7.99))
    menu.add(Dish.new("fu-king fried rice" , 5.99))
    return menu
  end

  def read_menu
    menu_hash = Hash.new
    @menu.dishes.each{ |dish| menu_hash.store("#{dish.name}", dish.price)}
    return menu_hash
  end

  def order(dish_name, quantity = 1)
    @basket = Basket.new
    add(dish_name, quantity)
  end

  def basket_summary
    basket_items = @basket.summary
    basket_items.collect{|basket_item| "#{basket_item.name} x#{basket_item.quantity} = £#{basket_item.sub_total}"}.join(', ')
  end

  def add(dish_name, quantity = 1)
    @menu.dishes.each{ |dish| @basket.add(dish, quantity) if dish.name == dish_name }
    "#{quantity}x #{dish_name}(s) added to your basket."
  end

  def total
    basket_items = @basket.summary
    basket_items.collect{|basket_item| basket_item.sub_total}.reduce(:+)
  end

  def checkout(total_price)
    raise "The total is not correct." unless is_correct_amount?(total_price)
    delivery_time = (Time.now + 1*60*60)
    send_text("Thank you for your order: £#{total}. It will be delivered before #{delivery_time.hour}:#{delivery_time.min}")
  end


  private

  def is_correct_amount?(total_price)
    self.total == total_price
  end

  def send_text(text)
    #Twilio API
  end

end
