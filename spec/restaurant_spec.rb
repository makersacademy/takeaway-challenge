require 'restaurant.rb'


describe Restaurant do 
  subject(:takeaway_restaurant) { Restaurant.new }
  let(:order) { double :order }
  let(:item1) { double :item_1}

  it 'responds to initialize' do
    expect { takeaway_restaurant }.not_to raise_error
  end

  describe '#view_menu' do 
    it 'includes chicken curry in the menu' do
      expect(takeaway_restaurant.menu_items).to include({ chicken_curry: 9.50 })
      expect(takeaway_restaurant.menu_items).to include({ pork_belly: 7.99 })
    end
  end

  describe '#create_order' do 
    it 'responds to create_order' do
      expect { takeaway_restaurant.create_order }.not_to raise_error
    end 

    # it 'asks Order to create a new instance of order' do 
    #   expect(order).to receive(:create_order)
    #   takeaway_restaurant.create_order
    # end
  end 

end