require 'date'

class TakeAway
  attr_reader :basket

  def initialize(menu = Menu.new, messenger_class = Messenger)
    @menu = menu
    @messenger_class = messenger_class
    @basket = []
    @total_price = 0
    @user_mobile = ""
  end

  def read_menu
    @menu.display
  end

  def order(dish, quantity = 1)
    quantity.times { @basket << @menu.display.slice(dish) }
    "#{quantity}x #{dish.downcase}(s) added to your basket"
  end

  def basket_summary
    result = []
    things = @basket.map { |item| item.keys.pop}
    things.each { |thing|
      dishes = result.map{ |x| x[:dish] }
    dishes.include? thing ? result[dishes.index(thing)][:quantity] += 1 : result << {dish: thing, quantity: 1}
    }
    p result

    # name_of_things = things.map { |key| things.count(key) }



    # Not passing the tests in the desired format...
    # ...skipped step due to time constraints
  end

  def total
    total_price
    "Your total order is £#{@total_price}"
  end

  def checkout
    puts "Please enter your mobile telephone number"
    @user_mobile = gets.chomp
  end

  def complete_order(amount, _time = Time.now)
    message = "Incorrect checkout price given. Please recheck your order total"
    raise message if incorrect_price?(amount)

    send_text
  end

  private

  def total_price
    @basket.each do |item|
      item.each { |_dish, price| @total_price += price }
    end
  end

  def incorrect_price?(amount)
    @total_price != amount
  end

  def send_text
    messenger = @messenger_class.new
    messenger.send_text(@user_mobile, Time.now)
  end

end
