class Takeway
  def initialize(menu = Menu.new, basket = Basket.new, text_providor = TextProvidor.new)
    @menu = menu
    @basket = basket
    @text_providor = text_providor
  end

  def show_menu
    puts @menu
  end

  def create_order(choice)
    # take out order items from menu and add to new array/hash
    # Also need to take into account quantity too
  end
end

class Dishes_with_prices
  def initialize(menu = [])
    menu = []
  end

  def add_item(name, price)
    raise "Please check price" unless price.is_a?(int) || price.is_a?(float)
    menu[name] = price
  end

  def remove_item(name)
    menu.delete(name)
  end
end

class Calculator
  def sum
    total = 0
    order.each do |item, price|
      total += price
      total 
    end
  end
  
  def receipt
    order.each do |item, price|
      puts "#{item} : #{price}"
  end
end

class Confirmation
  def send_text
    puts "Thank you! Your order was placed and will be delivered before #{time.Now + 1}"
  end
end