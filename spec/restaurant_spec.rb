require 'restaurant'

describe Restaurant do
  subject(:restaurant) {described_class.new('El Sombrero')}

  describe 'initialization' do

    it 'knows its own name' do
      expect(restaurant.name).to eq 'El Sombrero'
    end

  end

  describe 'is responsible for its own menu' do

    it 'can create a menu' do
      expect(restaurant.create_menu(double :filename)).to be_an_instance_of Menu
    end

    it 'can display a menu' do
      expect(restaurant).to respond_to(:display_menu)
    end

    it 'raises an error if not menu is available' do
      expect(restaurant.display_menu).to eq "No menu exists. Please contact the restaurant"
    end

  end

  describe 'is responsible for creating new orders' do

    it 'can create a new order' do
      expect(restaurant).to respond_to(:create_order)
    end

    it 'creates a new instance of an Order' do
      restaurant.create_menu('./lib/menu.csv')
      expect(restaurant.create_order).to be_an_instance_of Order
    end

  end

  # describe 'order summary' do
  # #  let(:order) {Order.new(double :menu)}
  # let(:restaurant) {Restaurant.new(double :name) { :order => order} }
  # let(:order) { Order.new(double :menu)}
  #
  #   it 'can display an itemised order summary' do
  #
  #     allow(order).to receive(:display_order_summary).with ("CHILE RELLENO x 3 = £10.50")
  #     expect(restaurant.display_order).to eq "Your total is: £10.50"
  #   end
  #
  # end


  describe 'is responsible for confirming order' do

    it 'triggers a new confirmation text' do
      expect(restaurant).to respond_to(:complete_order).with(1).argument
    end


# let(:text) { Text.new}
#     it 'creates a text' do
#       allow(text).to receive(:confirmation).
#       expect(restaurant.complete_order(double :phone_number)).to be_an_instance_of Text
#     end

  end

end
