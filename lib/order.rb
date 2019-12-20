class Order
  attr_reader :basket, :item, :quantity
  def initialize
    @basket = Hash.new(0)

  end

  def add_to_basket(item, quantity)
    basket[item] += quantity
  end

  def sum_of_basket(menu)
    basket.each do |item, quantity|
      print  "You have order #{item} & #{quantity} = £#{(menu.dishes[item]*quantity)},"
        end
  end

  # def total_basket

 end
