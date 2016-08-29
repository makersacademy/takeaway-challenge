#understands how to make an order by selecting items from user input
class Selection
  attr_reader :calc

  def initialize(calc=PriceCalculator)
    @calc = calc.new(select_items)
  end

  def select_items
    order = []
    selection = STDIN.gets.chomp.downcase

    while !selection.empty?
      puts "How many?"
      quantity = STDIN.gets.chomp.downcase
      order << {food: selection, quantity: quantity}
      p 'next selection?'
      selection = STDIN.gets.chomp.downcase
    end
    order
  end



end
