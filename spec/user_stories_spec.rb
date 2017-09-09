require './lib/menu.rb'
require './lib/takeaway.rb'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'I can see a list of dishes with prices' do
    takeaway = Takeaway.new
    expect(takeaway.see_menu).to eq @menu = { "Coconut Rice" => 5.45,
      "Jollof Rice" => 3.89, "Pounded Yam" => 3.85, "Dumplings" => 2.15,
      "Jerk Chicken" => 3.45, "Pepper Soup" => 3.15 }
  end

end
