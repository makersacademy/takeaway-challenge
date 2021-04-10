require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do { 
    "Kebab" => 10.5, "Chips" => 2.5
  }
  end

  it 'should store a list of dishes' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'should display a list of dishes' do
    display_menu = "Kebab £10.50, Chips £2.50"
    expect(menu.display).to eq(display_menu)
  end
end