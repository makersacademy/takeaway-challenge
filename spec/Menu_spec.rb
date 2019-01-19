require 'Menu'


RSpec.describe Menu do
  subject(:menu) { menu = Menu.new }

  it 'checks whether list of dishes exist' do
    expect(menu).to respond_to(:list_of_dishes)
  end

  it 'checks whether list includes dishes and prices' do
    expect(menu.list_of_dishes).to eq(menu.food_we_offer)
  end

  it 'allows to select number of dishes' do
    expect(menu).to respond_to(:select_dish).with(2).arguments
  end


end
