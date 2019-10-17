require 'menu'
require 'order'
# require 'dish'

describe Menu do
  it 'returns list of dishes' do
    expect(subject.print_menu).to eq('Egg Fried Rice, Prawn Crackers, Sweet and Sour Chicken, Beef Chow Mein')
  end

  it 'returns list of dishes with prices' do
    expect(subject.print_menu_with_prices).to eq("Egg Fried Rice: £3.00, Prawn Crackers: £2.00, Sweet and Sour Chicken: £5.00, Beef Chow Mein: £2.50")
  end
end
