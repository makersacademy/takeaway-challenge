require_relative 'menu'
require_relative 'basket'

class Restaurant

  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def show(obj)
    list(obj.dishes)
  end

private

  def list(arr)
    arr.each.with_index(1) do |d,i|
      amount = d.price.dup
      print "#{i}.".center(5)
      print d.name.ljust(30,'.')
      print  "£#{amount.insert(-3, '.')}".rjust(15,'.') + "\n"
    end
  end
end
