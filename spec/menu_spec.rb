require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'stores a list of dishes' do
    expect(menu.dishes).to eq ({"pizza" => 3.00, "coke" => 1.00})
  end

  it 'can print the dishes' do
    expect(puts menu).to eq nil
  end

  it 'can return the price of a dish' do
    expect(menu.price("pizza")).to eq 3
  end
end
