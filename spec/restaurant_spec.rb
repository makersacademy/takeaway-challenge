require 'restaurant'

describe Restaurant do
  subject(:restaurant) {described_class.new}


  it 'supplies a  set menu' do
    expect(restaurant.menu).not_to be_empty
end

 it 'prints the menu items and prices' do
    expect(restaurant.view).to be_a(String)
  end

end
