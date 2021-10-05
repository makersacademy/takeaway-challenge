require 'menu'

describe Menu do 
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do 
    {
    margherita: 8.99,
    salami: 9.99,
    hawaiiaan: 9.99,
    chips: 4.99 
  }
  end

  it 'see a list of dishes' do
    expect(menu.see_dishes).to eq(dishes)
  end

  it 'prints a menu' do
   full_menu = "Margherita £8.99, " "Salami £9.99, " "Hawaiiaan £9.99, " "Chips £4.99"
    expect(menu.print_menu).to eq(full_menu)
  end
  
  it 'checks if a dish is a available' do
    expect(menu.dish_available?(:margherita)).to be true 
  end
  # it 'selects a number of avaiulable dishes'
  #   expect()

end