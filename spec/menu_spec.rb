require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) { {"Beef" => 5.00, "Chicken" => 4.50, "Veg" => 3.50} }

  it 'list of dishes when initialized' do
    expect(menu.dishes).to include dishes
  end

end
