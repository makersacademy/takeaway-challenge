class Takeaway
  attr_reader :menu

  def initialize
    @menu = {
      Fish: 5.00,
      Scampi: 5.50,
      Chips: 1.50,
      Gravy: 2.00 
    }
  end

  def show_menu
    @menu.each { |meal, price| puts "-- #{meal} : £#{price} --" }
  end
end
