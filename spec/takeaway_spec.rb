require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }

  it 'allows user to order from the menu' do
    expect(takeaway).to respond_to(:place_order).with(2).argument
  end

  it 'updates the basket with the item and quantity' do
    takeaway.place_order('Funghi', 3)
    expect(takeaway.basket).to eq [{dish: 'Funghi', quantity: 3}]
  end

  
end
