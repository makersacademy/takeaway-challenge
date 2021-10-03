class TakeawayApp
  attr_accessor :basket

  def initialize(menu = Menu.new, sender = TwilioSender.new)
    @basket = []
    @menu = menu
    @sender = sender
  end

  def view_dishes
    puts @menu.print
  end

  def add_dish(dish_name, quantity)
    @menu.release(dish_name, quantity).each { |dish| @basket << dish }
  end

  def view_basket
    basket_components = @basket.map { |dish| "#{dish.name}: £#{dish.price}" } << "Total: £#{total}"
    puts basket_components.join(" \n")
  end

  def confirm_order
    puts "success, order sent"
    @sender.send_text(
      "Thanks for your order, it has been placed and will be delivered by #{time_an_hour_from_now}}"
    )
  end

  private

  def time_an_hour_from_now
    
    (Time.now + 1*60*60).to_s.split[1][0,5]
    
  end

  def total
    total = 0.00
    @basket.each { |dish| total += dish.price }
    total
  end
end

