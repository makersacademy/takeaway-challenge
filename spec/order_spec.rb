require 'order'
<<<<<<< HEAD

describe Order do
  subject(:order) { described_class.new }

  it "allows customer to see dishes available" do
    expect(order).to respond_to(:dish)
  end

  it "will return a list of dishes" do
    order.dish
    expect(order.list_of_dishes).to eq [{ "Roasted stuffed cauliflower" => 13},
                                        { "Stuffed pumpkin" => 12},
                                        { "Vegan chilli" => 15},
                                        { "Vegan brownies" => 8}]
=======
require 'menu'

describe Order do

  dish1 = {dish_name: 'Vegan Fish & Chips', dish_price: '12'}
  dish2 = {dish_name: 'Vegan Sausages', dish_price: '2'}

  subject(:order) { described_class.new([dish1, dish2]) }

  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it "should return the total amount for the order" do
    order.price_per_dish
    expect(order.total).to eq 28
>>>>>>> ffee618... create test and methods for totalling the order amount
  end
end
