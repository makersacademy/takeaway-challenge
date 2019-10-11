require 'menu'
require 'order'
# require 'dish'

describe Menu do
  it 'returns list of dishes' do
    expect(subject.print_menu).to eq('Egg Fried Rice, Prawn Crackers, Sweet and Sour Chicken')
  end

  it 'returns list of dishes with prices' do
    expect(subject.print_menu_with_prices).to eq("Egg Fried Rice: £3, Prawn Crackers: £2, Sweet and Sour Chicken: £5")
  end
end
