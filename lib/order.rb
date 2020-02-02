class Order
  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add_item(selection)
    Menu.new.menu_list.each do |k, _|
      if selection == k
        @order_list << k
      end
    end
  end
end
