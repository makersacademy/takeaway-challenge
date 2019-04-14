class Order

  attr_reader :select_pizza, :total_price

  def initialize
    @select_pizza = []
    @total_price = 0
    @successful = false
  end

  def add_selected_pizza(name)
    @select_pizza << name
    calculate_price
  end

  def confirm_order?
    @successful
  end

  def confirm_order
    if @total_price.positive?
      @successful = true
      @total_price = 0
      @select_pizza = []
    else
      puts 'You have not selected any Pizzas on your order!'
    end
  end

  def display_pizzas
    @select_pizza.each do |pizza|
      puts "Pizza: #{pizza[:name]} Price: #{pizza[:price]}"
    end
  end

  private
  def calculate_price
    @total_price = 0
    @select_pizza.each do |pizza|
      @total_price += pizza[:price]
    end
    puts "Your total price is: £#{@total_price}"
  end
end
