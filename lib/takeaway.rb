class Takeaway

  attr_reader :menu

  def initialize
    @menu = []
    menu << [1, "Chicken Chow Mein", "£6.00"]
    menu << [2, "Barbecue Spare Ribs", "£4.50"]
    menu << [3, "Special Fried Rice", "£5.50"]
    menu << [4, "Sweet and Sour Pork", "£5.00"]
    menu << [5, "Vegetable Spring Rolls", "£3.00"]
  end

  def menu
    @menu
  end

end
