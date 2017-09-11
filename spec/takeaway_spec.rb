require 'takeaway'

describe Takeaway do

subject(:takeaway) { described_class.new }
let(:dish) { "spring roll" }
let(:dish2) { "char sui bun" }
let(:quantity1) { 2 }
let(:quantity2) { 3 }
let(:summary){ {dish => [quantity1, Menu::MENU[dish]], dish2 => [quantity2, Menu::MENU[dish2]]} }
#let(:quantity) { 2 }
#let(:my_order) {}
  it "lets customer see a list of dishes with prices" do
    expect(takeaway).to respond_to :show_menu
  end

  it "lets customer select some number of several dishes" do
    takeaway.add_order(dish, quantity=1)
    expect(takeaway.basket[dish]).to eq ([quantity, Menu::MENU[dish]])
  end

  it "lets customer check that the basket matches the dishes ordered" do
    #it "has a basket summary" do
    @basket = {}
    takeaway.add_order(dish, quantity1)
    takeaway.add_order(dish2, quantity2)
    expect(takeaway.basket).to eq(summary)
  #end
  end

  it "lets customer check the total matches the order sum" do
    @basket = {}
    takeaway.add_order(dish, quantity1)
    takeaway.add_order(dish2, quantity2)
    #takeaway.basket = summary
    expect(takeaway.order_total).to eq(13.95)
  end

  it "raises an error if order_total doesn't match the exact total" do
    @basket = {}
    takeaway.add_order(dish, quantity1)
    takeaway.add_order(dish2, quantity2)
    takeaway.order_total != (13.95)
    message = "There is a problem with your order."
    expect{takeaway.order_confirm}.to raise_error message
  end

  it "completes the order" do
    message = "Thank you! Your order was placed and will be delivered before 18:52".
    expect(takeaway.order_complete).to receive(:send_notification).with message
  end

end
