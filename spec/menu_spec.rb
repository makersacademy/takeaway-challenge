require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'should be initialised with list of dishes and prices' do
    expect(menu.dishes.length).to eq 5
  end

  it 'should show the customer a list of menu items nd their price' do
    expect(menu.show_dishes).to eq ("pizza: £8\npasta: £6\nsalad: £8\nchips: £3\nburger: £9\n")
  end

end
