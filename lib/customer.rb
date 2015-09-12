class Customer

  attr_reader :basket

  def initialize
    @basket = []
  end

  def view_menu(takeaway)
    takeaway.menu
  end

  def add_item(takeaway, _item)
    fail 'Sorry that item is not on the menu' if takeaway.menu.key?(_item) == false
    @basket << _item
  end

  def place_order(takeaway)
    puts "Send us your number to confirm the order"
    @customer_number = "+447850122007"
    takeaway.receive_order
  end

  def bill(takeaway)
    final_bill = []
      self.basket.each do |item|
        if takeaway.menu.has_key?(item)
          final_bill << takeaway.menu[item]
        end
      end
      final_bill.inject(:+)
      place_order(takeaway)
  end

end
