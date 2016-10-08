require 'order'

describe Order do
  subject(:order) {described_class.new}

  it 'initialises an order' do
    expect(order).to be_a_kind_of(Order)
  end

  it 'can view the menu' do
    expect(order.view_menu).to eq(@menu)
  end


end
