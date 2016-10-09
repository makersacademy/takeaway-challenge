require 'order'
#require 'take_away_menu'
describe Order do

before :each do
  @menu = TakeAwayMenu.new
end
  subject(:order) {described_class.new}
  let(:item) {double("pasta")}

  # it 'has a list of dishes' do
  #   take_away_menu.list_dishes
  #   expect(take_away_menu).to respond_to(:list_dishes)
  # end
  
let(:item){double("pasta")}
  it 'has a method that allows you to order' do
    order.add_item(item)
    expect(order).to respond_to :add_item
  end

  # it 'can access the menu to take an order' do
  #   order.add_item(item)
  #   expect(:menu.items['pasta']).to eq 5
  # end

  it 'takes an item' do

    # dbl = double(add_item(item), 'pasta' => 5)
    order.add_item(item)
    # expect(dbl.items(item)).to eq 'pasta' => 5

  end
  # it 'allows you to add an item off the menu to a list' do
  #   menu = TakeAwayMenu.new
  #   order.add_item
  #   expect(list_of_items).to
  # end

  # it 'stores the food items as a list' do
  # menu = TakeAwayMenu.new
  #   order.add_item
  #   expect(order.list_of_items).to eq ['pasta' => 5]
  # end
 end
