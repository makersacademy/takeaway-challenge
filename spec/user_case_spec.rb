require 'restaurant'
require 'pry'

describe "Featuretests" do
  let(:margherita) { Item.new("Margherita", 8.50) }
  let(:veggie_delight) { Item.new("Veggie Delight", 5) }
  let(:coke) { Item.new("Coke", 2) }
  let(:pizzapizza) { Restaurant.new(margherita, veggie_delight, coke) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'should show the menu' do
    m = "Menu\n~~~~~~~~~~~\nMargherita - £8.5\nVeggie Delight - £5\nCoke - £2\n"
    expect { pizzapizza.menu }.to output(m).to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "can order a specified number of an item" do
    pizzapizza.new_order
    pizzapizza.add(margherita, 4)
    expect(pizzapizza.order.current_order.count(margherita)).to eq 4
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
