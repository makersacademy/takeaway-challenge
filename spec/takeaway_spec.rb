require 'takeaway'

describe Takeaway do

  it 'shows a menu for the customer' do
    expect(subject.menu).to eq({ "pizza" => 8, "salad" => 6, "fish and chips" => 10 })
  end

  it 'allows customers to choose a meal from the menu' do
    @order = ['pizza', 'salad']
    expect(subject.place_order).to eq(["pizza", "salad"])
  end

  it 'fails if customer enters an item not on the menu' do
    expect { subject.place_order }.to raise_error ('Did not enter a valid item')
  end

  it 'finds the total price of the meal' do
    @order = ['pizza', 'salad']
    expect(subject.calculate_total).to eq 14
  end
end


#Need to fix tests, test everything when using puts and add twillio
#Twilio number given to me not valid
