require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) do
    {
      "pepperoni" => 10,
      "vegetable" => 8,
      "margherita" => 8,
      "garlic bread" => 3,
      "chips" => 3,
      "coca-cola" => 2
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'can print the
   menu items and prices to the screen' do
    expect{menu.print_menu}.to output.to_stdout
  end

  it 'can see if a dish is on the menu' do
    expect(menu.has_item?("pepperoni")).to be true
  end

end
