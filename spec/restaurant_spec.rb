require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(menu, order) }
  let(:menu) { double :menu, dishes: nil, select_dish: dish }
  let(:order) { double :order, take_order: nil, text_confirmation: nil }
  let(:order2) { double :order2 }
  let(:dish) { double :dish }
  
  it 'responds to show_menu' do
    expect(restaurant).to respond_to(:show_menu)
  end
  
  describe '#show_menu' do
    it 'lists available dishes with prices' do
      expect(restaurant.show_menu).to eq(menu.dishes)
    end
  end
  
  describe '#place_order' do
    it 'takes an order with dish and quantity' do
      expect(restaurant).to respond_to(:place_order).with(2).arguments
    end
  end

  it 'can check the total cost of an order' do
    expect(restaurant).to respond_to(:check_total)
  end
  
  describe '#confirm_order' do  
    
    it 'confirms an order and sends a confirmation message' do
      expect(order).to receive(:text_confirmation)
      restaurant.confirm_order
    end
    
    it 'resets the current order' do
      restaurant.place_order('stuff')
      restaurant.confirm_order
      expect(restaurant.check_order).to be_empty
    end
    
  end

end

