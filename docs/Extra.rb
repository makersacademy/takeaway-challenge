def place_order()
  puts "For each dish in your order please enter the dish number, followed by the quantity. Press enter twice to place order"
  puts "What dish number would you like to order?"
  dish = gets.chomp
  puts "How many?"
  quantity = gets.chomp
  while !dish.empty? && !quantity.empty? do 
    @order << {Num: dish.to_i, Quantity: quantity.to_i}
    puts "You have ordered #{quantity} of the #{menu.index(dish)}"
    puts "What dish number would you like to order?"
    dish = gets.chomp
    puts "How many?"
    quantity = gets.chomp
  end
  puts "Your order:"
  @order
end

class Order

  attr_reader :menu, :index, :total
  attr_accessor :dish, :quantity, :order

  def initialize
    @menu = [{Num: 1, Name: "Chicken Katsu Curry", Price: 6}, {Num: 2, Name: "Sweet & Sour Chicken", Price: 6}, {Num: 3, Name: "Shredded Beef", Price: 8}, {Num: 4, Name: "Chicken Balls", Price: 4}]
    @order = [] 
    @total = 0 
  end 

  def see_menu
    @menu
  end 

  def place_order
    puts @menu
    puts "Please select using the dish numbers one at a time, which dishes you would like to order. To finish your order, press enter twice"
    
    puts "What dish number would you like to order?"
    dish = gets.chomp
    puts "How many #{find(dish)}, would you like to order?"
    quantity = gets.chomp
    @order << {dish: find(dish), quantity: quantity, price: price_per(dish) * quantity.to_i} if dish != ""
    puts "You ordered, #{quantity} of the #{find(dish)}"

    while !dish.empty? && !quantity.empty? do
    
      puts "What dish number would you like to order?"
      dish = gets.chomp
      puts "How many #{find(dish)}, would you like to order?"
      quantity = gets.chomp
      @order << {dish: find(dish), quantity: quantity, price: price_per(dish) * quantity.to_i} if dish != ""
      puts "You ordered, #{quantity} of the #{find(dish)}"
    end
    confirm
  end

  def confirm
  
    @order.each do |item|
      @total += item[:price].to_i
    end

    puts "This is your order: "
    puts @order
    puts "Your total is: #{@total}"
    puts "Are you happy with your order? Y/N"
    answer = gets.chomp
    delivery if answer == "Y" || "y"
    return @total
  end

  def delivery
  end

  def price_per(dish)
    case dish 
    when "1"
      @menu[0][:Price]
    when "2"
      @menu[1][:Price]
    when "3"
      @menu[2][:Price]
    when "4"
      @menu[3][:Price]
    when "5"
      @menu[1][:Price]
    end 
  end

  def find(dish)
    case dish 
    when "1"
      @menu[0][:Name]
    when "2"
      @menu[1][:Name]
    when "3"
      @menu[2][:Name]
    when "4"
      @menu[3][:Name]
    when "5"
      @menu[1][:Name]
    end 
  end

  def collect_order
    puts "What dish number would you like to order?"
    dish = gets.chomp
    puts "How many #{index(dish)}, would you like to order?"
    quantity = gets.chomp
    @order << {dish: index(dish), quantity: quantity, price: prices(dish) * quantity.to_i} if dish != ""
    puts "You ordered, #{quantity} of the #{index(dish)}"
  end

end 

require 'order'

describe Order do
  
  let(:order) { Order.new }

  context "When a customer wants to see the menu" do 
    it "should display a list of all the restaurants dishes, with their prices, and a dish number" do
      expect(order.see_menu).to eq(order.menu)
    end
  end 

  describe '#place_order' do 

    context "When a customer has decided on what they want to order" do 

      
      it "gets the customers order" do
        order.place_order
        allow(STDIN).to receive(:gets) { 1 }
        allow(STDIN).to receive(:gets) { 1 }
        expect(order.order).to eq([{:dish=>"Chicken Katsu Curry", :price=>6, :quantity=>"1"}])
      end

    
      it "should confirm each dish as it is added to the order" do 
        order.place_order
        allow(STDIN).to receive(:gets) { 1 }
        allow(STDIN).to receive(:gets) { 1 }
        expect(order.total).to eq 12
      end 


    end
  end
end