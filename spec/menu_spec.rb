require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'contains a list items of food and drink available for takeaway' do
    expect(menu.dishes).to include("Pure Beef Hamburger")
  end

  it 'contains prices of items on the menu' do
    expect(menu.dishes).to include ({"Pure Beef Hamburger" => 1})
  end


end
