require 'menu'

describe Menu do

  subject(:menu) {described_class.new(order_class)}

  let(:order_class) {double :order_class, new: order}
  let(:order) {double :order, dishes: {1=>1, 3=>2}}


  context '#display' do
    it 'displays the menu' do
      expect{menu.display}.to output(Menu::MENU).to_stdout 
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
    it 'returns the appropriate message showing dishes and total cost' do
      allow(order).to receive(:add_dishes)
      menu.choose_dishes([1,1],[3, 2])
      allow(order).to receive(:show_dishes) {order.dishes}
      expect(menu.check_order).to eq("Chicken Fried Rice x 1 : \u00A3 5\nStir-Fried Noodles x 2 : \u00A3 14\nTotal Price: \u00A319")
    end
  end

  context '#close_order' do
    it 'responds to #close_order' do
      expect(menu).to respond_to(:close_order)
    end
  end



end