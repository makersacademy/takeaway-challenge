require 'takeaway'

describe Takeaway do
  let(:menu) { {burger: 5.99, fries: 3.99, pizza: 7.99} }
  let(:takeaway ) { Takeaway.new(menu) }

  it 'shows the food menu with prices' do
    takeaway
    expect(takeaway.show_menu).to eq(menu)
  end

  it 'can order food from the menu' do
    takeaway
    takeaway.place_order({ burger: 2, fries: 2 }).to eq(19.96)
  end
end