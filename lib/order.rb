require_relative 'menu'
require_relative 'sms'

class Order

  attr_reader :trolley, :menu

  def initialize
    @menu = Menu.new
    @trolley = []
  end

  def add_to_order(number)
    choice = menu.pizzas.values[number - 1]
    @trolley << choice
  end

  def view_order
    puts "Your Order:"
    @trolley.each_with_index do |choices, i|
      choices.each do |dish, price|
        puts "#{i + 1}. #{dish}, #{price}"
      end
    end
    puts "Total: $#{total_price}"
  end

  def total_price
    prices = []
    @trolley.each { |choices| choices.each { |_, price| prices << price[1..-1].to_i } }
    return 0 if prices.empty?
    prices.reduce(:+)
  end

  def confirm_total(amount)
    raise "Sum is not equal to total amount." if amount != total_price
    "Amount is correct."
  end

  def place_order
    Sms.new.send_message
  end

end
