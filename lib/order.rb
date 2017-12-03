class Order

  attr_reader :basket, :choice, :quantity

  def initialize(menu)
    @basket = []
    @menu = menu
  end

  def add(choice, quantity = 1)
    @choice, @quantity = choice, quantity
    fail "Item not on menu" if !@menu.include?(choice)
    @quantity.times do
      @basket << @menu.select {|dish, price| dish == choice }
    end
    puts "#{@quantity} x #{@choice} added to basket"
  end

  def get_choice
    puts "What would you like to order?"
    @choice = STDIN.gets.chomp
  end

  def get_quantity
    puts "How many would you like?"
    @quantity = STDIN.gets.to_i
  end

end
