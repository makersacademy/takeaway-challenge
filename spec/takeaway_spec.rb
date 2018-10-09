require 'takeaway'

describe Takeaway do

  it 'can display a food item' do
    expect(subject.display_menu).to include('margherita')
  end

  it 'displays food items with their prices' do
    expect(subject.display_menu).to eq({
      "margherita"=>8,
      "pepperoni" =>9,
      "vegetarian"=>9})
  end

  it 'allows user to select multiple items to order' do
    expect().to eq()
  end


end
