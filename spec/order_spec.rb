require 'order'
#require 'take_away_menu'
describe Order do
  subject(:order) {described_class.new}
  # it 'has a list of dishes' do
  #   take_away_menu.list_dishes
  #   expect(take_away_menu).to respond_to(:list_dishes)
  # end

  it 'has a method that allows you to order' do
    order.add_item
    expect(order).to respond_to :add_item
  end

  it 'can access the menu to take an order' do
    menu = TakeAwayMenu.new
    order.add_item
    expect(menu.items['pasta']).to eq 5
  end

  # it 'allows you to add an item off the menu to a list' do
  #   menu = TakeAwayMenu.new
  #   order.add_item
  #   expect(order).to respond_to add_item
  # end
    it 'has a list of added items' do
    expect(order).to respond_to(:list_of_items)
    end
 end
