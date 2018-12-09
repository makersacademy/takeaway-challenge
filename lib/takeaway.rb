class Takeaway

  attr_reader :menu, :dishes, :prices, :total, :item, :cost, :quantity

  def initialize
    @menu = {}
    @dishes = []
    @prices = []
    @total = 0
    @item = item
    @cost = 0
    @quantity = 0
  end

  def menu
    @menu = {
      "saveloy" => 2.50,
      "chicken" => 2.50,
      "chips" => 2.00,
      "cod" => 5.00,
      "plaice" => 5.00,
      "pizza" => 3.00,
      "salad" => 4.00,
      "peroni" => 3.50
    }
  end

  def select_item(item, quantity)
    @item = item.downcase
    @quantity = quantity
  end

  def add_item_to_list
    @cost = @menu[@item]
    @quantity.times do
      @dishes << @item
      @prices << @cost
    end
  end

  def get_total_cost
    @total = @prices.reduce(0){|sum,num| sum + num }
  end

  def sum_correct?
    @total == @prices.reduce(0){|sum,num| sum + num } ? true : false
  end

  def print_order
    fail 'Incorrect total' if !sum_correct?
    summary = @dishes.each_with_object(Hash.new(0)) { |dish,counts| counts[dish] += 1 }
    puts "You have ordered the following:"
    summary.each do |dish, counts|
      puts "#{dish.capitalize}: x #{counts}"
    end
    puts "Total cost: £#{@total}"
    "Thank-you for your order."
  end

end
