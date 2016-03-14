require 'menu'

describe Menu do
  let(:order) {{:steak=>1,:chips=>3,:pizza=>2}}
  subject(:menu) {described_class.new}

  it 'should return the price of a given quantity of food items' do
    expect(menu.price(:steak,2)).to eq 30
  end

  it 'should return a formatted menu as a string' do
    expect(menu.food).to include "steak"
  end

  it 'can create a receipt for the order order' do
    expect(menu.create_receipt(order)).to eq 44
  end

end
