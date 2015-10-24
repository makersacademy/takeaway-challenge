class Menu
  DEFAULT_MENU = [{food: "Salt and Pepper King Prawn", price: 3.99, quantity_ordered: 0}, {food: "Pork Dumplings", price: 2.50, quantity_ordered: 0}]

  attr_reader :menu, :total_basket

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

  def add(food, quantity=1)
    @menu.each{ |elem| elem[:quantity_ordered] += quantity if elem[:food] == food }
  end

  def total
    "£#{sprintf("%.2f",@menu.inject(0) {|sum, elem| sum += (elem[:quantity_ordered] * elem[:price])})}"
  end

  def view_menu
    @menu.each do |elem|
      puts "#{elem[:food]} - £#{sprintf("%.2f", elem[:price])}"
    end
  end
end