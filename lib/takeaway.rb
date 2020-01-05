require_relative 'menu'

class TakeAway
  attr_reader :menu, :basket, :sum

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @sum = 0
  end

  def read_menu
    @menu.list
  end

  def select(choice, count)
    name = @menu.items.keys[choice - 1]
    add(name, count)
    add_sum(name)
  end

  def add(name, count)
    @basket[name] = count
    puts "#{count}x #{name} added to your basket."
  end

  def add_sum(name)
    @sum += @menu.items[name]
  end

  def basket_summary
    @basket.each do |key, value|
      puts "#{key} x#{value} = #{@menu.items[key] * value}"
    end
  end

  def total
    "Total: £#{@sum}"
  end

  def checkout(cost)
    cost == @sum ? success : "Your order was unsuccessful."
  end

  def success
    send_text("Thank you for your order: £#{@sum}")
    time = Time.now + 1*60*60
    "Thank you! Your order was placed and will be delivered before #{time.strftime("%k:%M")}."
  end

  def send_text(message)
    # this method calls the Twilio API
  end
  
end
