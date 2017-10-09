require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'should be initialised with list of dishes and prices' do
    expect(menu.dishes.length).to eq 5
  end

  it 'should show the customer a list of menu items nd their price' do
    expect(menu.show_dishes).to eq "Pizza: £8\nPasta: £6\nSalad: £8\nChips: £3\nBurger: £9\n"
  end

end
