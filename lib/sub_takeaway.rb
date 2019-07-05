class SubTakeaway
  attr_reader :menu, :chosen_items

  def initialize
    # @chosen_items = []
    @menu = [
    {item: "Turkey Breast & Ham Value Sub", price: 4.19},
    {item: "BLT Value Sub", price: 4.19},
    {item: "Ham Value Sub", price: 4.19},
    {item: "Veggie Delite Value Sub", price: 4.19},
    {item: "Chicken Breast Classic Sub", price: 3.59},
    {item: "Italian BMT Classic Sub", price: 3.59},
    {item: "Beef Classic Sub", price:	3.59},
    {item: "Chicken Tikka Classic Sub", price: 3.59},
    {item: "Spicy Italian Classic Sub", price: 3.59},
    {item: "Chicken & Bacon Ranch", price: 5.59},
    {item: "Chicken Pizziola", price: 5.59},
    {item: "Sweet Onion Chicken Teriyaki", price:	5.59},
    {item: "Steak & Cheese", price: 5.59},
    {item: "Veggie Patty", price: 5.59},
    {item: "Meatball Marinara", price: 5.59},
    {item: "Subway Melt", price:	5.59 },
    {item: "Coca Cola", price: 1.49},
    {item: "Sprite", price: 1.49},
    {item: "Fanta", price: 1.49},
    {item: "Water", price: 0.79}
  ]
  end

  def show_menu
    # printed_menu = []
    @menu.each do |menu|
      # printed_menu << "#{menu[:item]} - #{menu[:price]}"
      puts "#{menu[:item]} - #{menu[:price]}"
    end
    # printed_menu.join("\n")
  end

  def choose(item, quantity)
    @menu.each do |menu|
      if item == menu[:item]
        return {item: menu[:item] , price: menu[:price], quantity: quantity}
      end
    end
  end
end
