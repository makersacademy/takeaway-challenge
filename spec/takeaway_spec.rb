require 'takeaway'
require 'menu'

describe Takeaway do

  let(:takeaway) { Takeaway.new(mockMenu, mockOrder, mockText) }
  let(:mockMenu) { double :menu, dishes: [mockDish]}
  let(:mockOrder) { double :order, add: [mockDish], basket: [mockDish], total: 2}
  let(:mockText) { double :message, send: "Your order will be ready in an hour" }
  let(:mockDish) { double :dish, name: "Green Eggs and Ham", price: 2}

  describe "#add_to_order" do
    it "adds a dish to the .order" do
      expect(takeaway.add_to_order(mockDish)).to eq( [mockDish] )
    end
  end

  describe "#remove_from_order" do
    it "removes a dish from the order" do
      
    end
  end

  describe "#show menu" do
    it "lists the dishes and price on a menu" do
      expect(takeaway.show_menu).to eq "#{mockDish.name}, £#{mockDish.price}\n"
    end
  end

  describe "#checkout" do
    it "confirms the order and sends a text" do
      expect(takeaway.checkout).to eq "Your order will be ready in an hour"
    end
  end

end

=begin
class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def add_to_order(dish)

  end

  def remove_from_order(dish)

  end

  def pay

  end

end

class Menu
  dish_list
  def initialize(dishes = dish_list)
    @dishes = dishes
  end

  def find(dish)

  end

end

class Dish
  attr_reader :name, :contents, :price

  def initialize(name, contents, price)
    @name = name
    @contents = contents
    @price = price
  end

end

class Order

  def initialize
    @order = []
  end

  def order_total
    total = 0
    @order.each { |dish| total += dish.price }
    total
    @order.map{ |d| d.price }.inject(:+)
  end

  def complete_order

  end

end

=end
