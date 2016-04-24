require 'customer'

describe Customer do

  subject(:customer) { described_class.new(menu, order) }
  let(:menu) { double :menu, dishes: nil, select_dish: dish }
  let(:order) { double :order }
  let(:dish) { double :dish }
  
  it 'responds to show_menu' do
    expect(customer).to respond_to(:show_menu)
  end
  
  describe '#show_menu' do
    it 'lists available dishes with prices' do
      expect(customer.show_menu).to eq(menu.dishes)
    end
  end
  
  describe '#place_order' do
    it 'takes an order with dish and quantity' do
      expect(customer).to respond_to(:place_order).with(2).arguments
    end
  end

  it 'can check the total cost of an order' do
    expect(customer).to respond_to(:check_total)
  end
  
  describe '#confirm_order' do  
    
    it 'confirms an order and sends a confirmation message' do
      expect(order).to receive(:text_confirmation)
      customer.confirm_order
    end
    
    xit 'resets the current order' do
      customer.place_order('stuff')
      customer.confirm_order
      expect(customer.check_order).to be_empty
    end
    
  end

end

