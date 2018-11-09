class Takeaway
  attr_reader :pricelist, :name, :quantity, :sum

  def initialize
    @pricelist = []
    @totals = []
  end

  def show_price_list
    @price_list = [
      { :item => "Jacket Potato (plain)", :cost => 1.00 },
      { :item => "Jacket Potato with cheese", :cost => 1.50 },
      { :item => "Jacket Potato with Tuna", :cost => 2.00 },
      { :item => "Spaghetti Bolognese", :cost => 3.50 },
      { :item => "Spaghetti Carbonara", :cost => 3.00 },
      { :item => "Chicken Curry", :cost => 5.00 }
    ]
  end

  def add_order(names, quantity, sum)
    @name = names.to_s
    @quantity = quantity.to_i
    @sum = sum.to_f
    @pricelist << [@name, @quantity, @sum]
    @totals << @quantity * @sum
  end

  def total
    @totals.reduce(:+)
  end

  def place_order
    puts "Thank you your order has been placed"
    exit
  end

  # def compare_totals
  #   @pricelist.each do
  #   @price_list.each do |item_name, quality, price|
  #
  #
  #     raise "Incorrect total added" if @totals != total
  #   end
  # end
end
