require 'takeaway'

describe Takeaway do

  it 'shows a menu for the customer' do
    expect(subject.show_menu).to eq({ "pizza" => 8, "salad" => 6, "fish and chips" => 10 })
  end

  it 'allows customers to choose a meal from the menu' do
    subject.place_order "salad"
    expect(subject.place_order "pizza").to eq(["salad", "pizza"])
  end

  it 'fails if customer enters an item not on the menu' do
    expect { subject.place_order "burger" }.to raise_error ('Item not found in menu')
  end

  it 'finds the total price of the meal' do
    subject.place_order "pizza"
    subject.place_order "salad"
    expect(subject.calculate_total).to eq 14
  end
end


#Tests broken when added user interface
