class Order

  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def add(item, quantity)
    @item = item.to_sym
    @quantity = quantity
    @menu.all_dishes.each do |dish|
      @dish = dish
      dish.each do |name, price|
        if name == @item
          quantity.times {@basket << @dish}
          quantity.times {@total += price}
        end
      end
    end
    @basket
  end

  def basket_summary
    puts @basket
    "Your total for this order is £#{@total}. Please proceed to checkout."
  end

  def checkout(money)
    @money = money
    if @money < @total
      "Please checkout with the correct amount"
    else
      send_message
    end
  end

  private

  def send_message
    puts "You will be tipping £#{@money - @total}. Do you wish to confirm?(Y/N)"
    answer = gets.chomp
    if answer.upcase == "Y"
      puts "What number would you like the confirmation text to be sent to? (+44 format)"
      number = gets.chomp
      Message.new.send(number)
      "Thank you for ordering, you will receive a text shortly"
    elsif answer.upcase == "N"
      "Please checkout again"
    else
      "Invalid input. Please checkout again"
    end
  end


end
