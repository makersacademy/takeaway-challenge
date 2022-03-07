require_relative 'menu'
require_relative 'sms'

class Order
  attr_reader :basket

  def initialize 
    @basket = []
    #eventually would be equal to a premade menu object (i.e Italian_restaurant) or would be able to select a premade menu
    @menu = Menu.new   
  end

  def add_dish_to_basket(dish)
    count = 0
    @menu.menu.each { |food| @basket << food && count +=1 if food.name == dish }
    raise 'There is no such dish on the menu' if count == 0
  end

  def remove_dish_from_basket(dish) 
    matching_dishes = @basket.select { |food| food.name == dish}
    if matching_dishes.count >= 1 
      @basket.delete_at(@basket.index(matching_dishes[0])) 
    else
      raise "This dish is not currently in your basket"
    end
  end

  def calculate_order_price
    @cost = 0
    @basket.each { |dish| @cost += dish.price }
    if basket.empty?
      puts "Your basket is empty"
    else 
      puts "Your order total is currently £#{@cost}"
    end
    @cost
  end

  def complete_order
    calculate_order_price
    @basket = []
    send_sms #would be added once twilio functionality added
  end

  private

  def send_sms  
    text = SMS.new
    message = "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%k:%M")}"
    text.send_sms(message)
  end

end
