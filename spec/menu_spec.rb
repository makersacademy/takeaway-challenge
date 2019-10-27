require 'menu'

describe Menu do
  subject(:menu) { described_class.new(items: items) }
  let(:items) do
    { 'Pizza Margherita' => 7,
      'Pepperoni Pizza' => 8,
      'Chicken Supreme' => 9,
      'Vegetarian Supreme' => 8,
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.items).to eq(items)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Pizza Margherita: £7\nPepperoni Pizza: £8\nChicken Supreme: £9\nVegetarian Supreme: £8"
    expect(menu.print).to eq(printed_menu)
  end
  
  it 'calculates prices of individual dishes' do
    expect(menu.price('Pepperoni Pizza')).to eq(items['Pepperoni Pizza'])
  end


end