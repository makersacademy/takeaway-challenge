class Takeway
  def initialize(menu = Menu.new)
    @Menu = menu
  end

  def show_menu
    puts @menu
  end

  def create_order

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