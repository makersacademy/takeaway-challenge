class Basket

  attr_reader :selection, :selections

  def initialize
    @selections = []
    @selection = {}
  end

  def add_dish(dish: '', price: 0, quantity: 0)
    @selection[:dish] = dish
    @selection[:price] = price
    @selection[:quantity] = quantity
    @selections << @selection
    @selection = {}
    @selections
  end

  def display_summary
    @selections.each do |selection|
      puts "#{selection[:dish]} x #{selection[:quantity]} = " +
      "£#{selection[:price] * selection[:quantity]}"
    end
  end

  def display_total
    puts "Your total is £#{@total}."
  end

  def total_cost
    @total = @selections.map { |selection|
      selection[:price] * selection[:quantity]
    }.reduce :+
  end
end
