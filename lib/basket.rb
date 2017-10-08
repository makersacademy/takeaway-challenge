class Basket

attr_reader :basket_contents, :subtotal

  def initialize
    @basket_contents = []
    @subtotal = 0
  end

  def new_item(item)
    @subtotal += item[:cost]
    @basket_contents << item
  end

  def check_total
    @basket_contents.map {|item| item[:cost]}.sum == subtotal
  end
end
