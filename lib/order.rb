class Order

  attr_reader :my_order

  def initialize(my_order = [])

    @my_order = my_order
  end

  def select(item, quantity)
    Menu::LIST.each do |hash|
      if item == hash[:item]
        quantity.times { @my_order << hash }
      end
    end
    @my_order
  end

end
