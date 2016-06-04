require_relative 'menu'

class TakeAway

  def initialize
    @menu = [{:name => "Pasta", :price => 10},
             {:name => "Pizza", :price => 15},
             {:name => "Wrap", :price => 8},
             {:name => "Muffin", :price => 4}]
    @order = nil
  end

  def show_menu
    puts @menu
  end

  def take_order
    @order = gets.chomp
    @order = @order.split(',')
    @order.collect! { |x| x.strip  }
    p @order
  end

end
