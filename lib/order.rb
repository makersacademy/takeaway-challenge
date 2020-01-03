require_relative 'text'

class Order
  def initialize(text = Text.new)
    @text = text
  end

  def total(basket)
    total = []
    basket.basket.each do |dish|
      total << dish.values
    end
    total.flatten.inject(:+)
  end

  def checkout(basket)
    return puts "Your basket is empty, can't proceed with checkout\n\n" if basket.empty?

    puts "You are proceeding with the checkout.\nYour total is £ #{total(basket)}\nContinue?"
    pay = gets.chomp.downcase
    if pay == "yes"
      @text.send_text
      basket.clear
      puts "Your order is placed\n\n"
    else
      puts "Your order is not placed\n\n"
    end
  end
end
