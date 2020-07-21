class Takeaway

  attr_reader :items, :your_order, :total

  def initialize
    @items = {"pizza" => 10, "chips" => 2, "wings" => 5, "coke" => 1, "chicken" => 6, "pasta" => 7.50}
    @your_order = []
    @total = 0
  end

  def menu
    @items
  end

  def order(item, quantity = 1)
    add_to_list = @items.assoc(item)
    quantity.times { @your_order.push(add_to_list) }
    quantity.times {@total += @items[item]}
  end

  def finish_order
    @your_order.each do |x|
      puts x.each { |p| p }.join("          ")
    end
    puts "Your total is £#{@total}"
  end
end
