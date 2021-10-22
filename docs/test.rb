class Takeaway
  attr_reader :menu, :my_order

  def initialize 
    @menu = [
      { name: "Beef curry", price: 12 },
      { name: "Fish curry", price: 14 },
      { name: "Lamb curry", price: 10 },
    ]
    @my_order = []
  end

  def add_to_order(order)
    @menu.each do |item|
      if item.has_value?(order)
        @my_order << item
      end
    end

    p @my_order
  end
end

takeaway = Takeaway.new
takeaway.add_to_order("Beef curry")