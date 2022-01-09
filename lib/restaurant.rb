class Restaurant

  def initialize(new_menu = write_menu())
    @menu = new_menu
  end

  def show_menu
    @menu.menu
  end

  def create_order
    @current_order = Order.new(@menu)
  end

  def add_dish_to_order(dish)
    @current_order.add_dish(dish)
  end

  def show_order(order = @current_order)
    return 'Nothing to show' if @current_order.nil?
    show = order.basket.clone
    show << { 'Sum' => order.calc_sum }
    return show
  end

  def submit_order(order = @current_order)
    order.finish_order
    send_sms(create_confirmation_string(Time.now, order.calc_sum))
  end
  
  private

  # initiate dummy menu
  def write_menu
    menu = Menu.new()
    menu.add_dish('Chips', 6.40)
    menu.add_dish('Fish', 8.0)
    menu.add_dish('Beer', 3.20)
    menu.add_dish('Milk', 1.00)
    return menu
  end

  def create_confirmation_string(time, sum)
    hour = time.hour + 1
    hour = 0 if hour == 24
    min = time.min
    time_string = "#{hour}:#{min}"
    sum_string = sprintf("%#.2f", sum)
    return "Order has been submitted and will arrive #{time_string}! To be paid: #{sum_string}€" 
  end

  def send_sms(body)
    return body
  end

end
