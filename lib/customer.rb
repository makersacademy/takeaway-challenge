class Customer

  attr_reader :basket

  def initialize
    @basket = []
  end

  def view_menu(takeaway)
    takeaway.menu
  end

  def add_item(takeaway, item)
    fail 'Sorry that item is not on the menu' unless takeaway.menu.key?(item)
    @basket << item
  end

  def place_order(takeaway)
    puts "Send us your number to confirm the order"
    customer_number = "+447850122007"
    takeaway.send_message
  end

  def bill(takeaway)
    final_bill = []
      self.basket.each do |item|
        if takeaway.menu.has_key?(item)
          final_bill << takeaway.menu[item]
        end
      end
    final_bill.inject(:+)
  end

end
