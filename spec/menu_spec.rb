require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'stores a list of dishes' do
    expect(menu.dishes).to eq ({"Pizza" => 5.00, "Coke" => 1.00})
  end

  it 'can print the dishes' do
    expect(puts menu).to eq (nil)
  end
end
