require './lib/menu.rb'
require './lib/takeaway.rb'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'I can see a list of dishes with prices' do
    takeaway = Takeaway.new
    expect(takeaway.see_menu).to eq @menu = { "Coconut Rice" => 5.45,
      "Jollof Rice" => 3.89, "Pounded Yam" => 3.85, "Dumplings" => 2.14,
      "Jerk Chicken" => 3.45, "Pepper Soup" => 3.15 }
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "I can select a number of several available dishes" do
    takeaway = Takeaway.new
    takeaway.see_menu
    takeaway.place_order("Pounded Yam", 2)
    takeaway.place_order("Dumplings", 3)
    expect(takeaway.order).to eq [{"Pounded Yam x2"=>7.7}, {"Dumplings x3"=>6.42}]
  end
end
