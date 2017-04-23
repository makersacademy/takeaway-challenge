require_relative 'menu'
require_relative 'sms'

class Order

  attr_reader :trolley, :menu, :quantity

  def initialize
    @menu = Menu.new
    @trolley = []
  end

  def add_to_order(number)
    choice = @menu.pizzas.values[number - 1]
    @trolley << choice unless choice.nil?
    return "Invalid number. Please select a valid dish." if choice.nil?
    "#{choice.keys[0]} pizza added."
  end

  def counts_dishes
    @quantity = Hash.new(0)
    @trolley.each { |elem| @quantity[elem] += 1 }
  end

  def view_order
    puts "Your Order:"
    line = 30
    counts_dishes
    @quantity.each do |choices, count|
      choices.each do |dish, price|
        puts "#{dish}, #{price}".ljust(line / 2, ".") + "x#{count}".rjust(line / 2, ".")
      end
    end
    puts "Total: $#{total_price}".rjust(line)
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
    @trolley = []
  end

end
