class OrderForm
  
  attr_reader :order

  def initialize
    @order = []
    @dishes = { Noodles: 3.00, Rice: 2.50 }
  end

  def show_dishes
    @dishes.map{|k,v| "#{k} (£#{'%.2f' % v})"}.join(', ')
  end

  def add_dish dish, quantity
  	quantity.times { order << dish }
  	"#{quantity} x #{dish} added"
  end

end