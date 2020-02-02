class Order
  attr_reader :dishes_list

  def initialize
    @dishes_list = [{:quantity => 0, :dish => ""}]
  end

  def print_out
    if @dishes_list == [{:quantity => 0, :dish => ""}]
      p "Order is empty"
    else
      total_price = 0
      @dishes_list.each do |item|
        p "#{item[:dish]} x £#{item[:quantity]}"
        item_price = item[:dish].price * item[:quantity]
        total_price += item_price
      end
      p "That comes to £#{total_price}0"
    end
  end
end