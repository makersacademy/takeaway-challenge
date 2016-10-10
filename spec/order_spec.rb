require 'order'
#require 'take_away_menu'
describe Order do

before :each do
  @menu = TakeAwayMenu.new
end
  subject(:order) {described_class.new}
  let(:item) {double("pasta")}
  let(:amount) {double(2)}

  it 'has a list of dishes' do
      @menu.list_dishes
      expect(@menu).to respond_to(:list_dishes)
    end

  it 'has a method that allows you to order' do
    order.add_item(item)
    expect(order).to respond_to :add_item
  end

  it 'can access the menu to take an order' do
      order.add_item(item)
      expect(@menu.items['pasta']).to eq 5
    end

  it 'allows you to add an item off the menu to a list' do
      order.add_item('pasta')
      expect(order.list_of_items).to include({'pasta' => 5})
    end

    it 'allows you to add more than one item' do
        expect(order.add_item(item, amount)).to respond_to(2).arguments
    end



 end
