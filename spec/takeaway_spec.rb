require 'takeaway'

describe Takeaway do
let(:takeaway){Takeaway.new}

  it 'prints list of food and prices' do
    expect(subject.food_prices).to include("chips" => 5.50, "wings" => 7.20, "burger" => 8.50)
  end

  it 'selects food menu' do
    subject.food_prices
    subject.choose_menu
    expect(subject.user).to eq("chips")
  end
  

end
