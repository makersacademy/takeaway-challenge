require_relative 'menu'

class Order

  attr_reader :order, :menu_list

  def initialize
    @order = Hash.new(0)
  end

  def check_menu
    puts menu_list
  end

  def add_order(name, quantity)
      @order[name] = quantity
      order.each {|key, value| puts "you have added #{key} times #{value} to your order" }
      @order
  end

  def order_sum
      raise 'The basket is empty' if order.empty?
      @order.map {|item, qty| print "#{item} x #{qty} = £ #{menu.dish[item] * qty}"}
  end

    private

    def empty?
      @order == 0
    end

end


=begin



def basket_sum
    raise 'The basket is empty' if basket.empty?
    @basket.map {|item, qty| print "#{item} x #{qty} = £ #{menu.dish[item] * qty}"}
  end

  def basket_sum
    raise 'Basket is empty' if basket.empty?
    output = “"
    @basket.each {|item, qty| output = output + “\n” +  "#{item} x #{qty} = £ #{menu.dish[item] * qty}"}
    output
end

def add_order(name, quantity)
    @basket[name] = quantity
    basket.each {|key, value| puts "you have added #{key} times #{value} in your basket" }
    @basket
  end

you should set your hash as hash  = Hash.new(0) (this will give you a default value of 0). Then when you order an item with a quantity you add it to the hash like this: hash[item] += quantity

Hamza Sheikh [12:08 PM]
this way if you have order the same item, it will automatically increment the quantity in the hash

=end
