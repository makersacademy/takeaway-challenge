class Restaurant

attr_reader :name, :menu

  def initialize(name)
    @name = name
    @menu = {
      "Cheese burger": 10,
      "Cheese and bacon burger": 12,
      "Pulled pork burger": 15,
      "Fries": 6,
      "Chilli fries": 8,
      "Onion rings": 7,
      "Coke 330ml": 2,
      "Fanta 330ml": 2,
      "Brew Dog Vegabond 4.5%": 5 }
  end

  def view_menu
    @print = ["#{@name}'s Menu:\n"]
    num = 1
    unless num >= @menu.length
      @menu.each do |dish, price|
        @print << "#{num}: #{dish}, £#{price}\n"
        num+=1
      end
    end
    @print.join(", ").chomp
  end

end
