require 'menu'

describe Menu do

  subject(:menu) {described_class.new(order_class)}

  let(:order_class) {double :order_class, new: order}
  let(:order) {double :order, dishes: {1=>1, 3=>2}}


  context '#display' do
    it 'returns the menu' do
      expect(menu.display).to eq(Menu::MENU)
    end
  end


  context '#choose_dishes' do
    it 'creates a new order if one does not yet exist, and stores in in an instance variable' do
      allow(order).to receive(:add_dishes)
      expect{menu.choose_dishes([1,1],[3, 2])}.to change{menu.current_order}.to eq(order)
    end
    it 'calls the Order class\' #add_dishes method to add to an existing order' do
      allow(order).to receive(:add_dishes) {true}
      expect(menu.choose_dishes([1,1],[3, 2])).to eq(true)
    end
  end


  context '#check_order' do
    it 'checks that menu responds to #check_order' do
      expect(menu).to respond_to(:check_order)
    end
  end


  context '#place_order' do
    it 'responds to #close_order' do
      expect(menu).to respond_to(:place_order)
    end
  end

end