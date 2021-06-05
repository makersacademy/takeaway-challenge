require 'takeaway'

describe Takeaway do
  let(:menu) { {burger: 5.99, fries: 3.99, pizza: 7.99} }
  let(:takeaway ) { Takeaway.new({burger: 5.99, fries: 3.99, pizza: 7.99}) }

  it 'shows the food menu with prices' do
    takeaway
    expect(takeaway.show_menu).to eq(menu)
  end

  it 'lets the user order food' do

  end
end