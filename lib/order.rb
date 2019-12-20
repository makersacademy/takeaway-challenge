class Order
  attr_reader :basket, :item, :quantity, :menu
  def initialize
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_to_basket(item, quantity)
    basket[item] += quantity
  end

  def sum_of_basket
    basket.each do |item, quantity|
        puts "You have order #{item} & #{quantity} = £#{(menu.dishes[item]*quantity)}, "
        end
  end

 end
