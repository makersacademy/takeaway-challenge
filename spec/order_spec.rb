require 'order'

describe Order do

  it { is_expected.to respond_to :current_order }

  describe '#get_total' do
    it 'should sum the order and set @order_total' do
      restaurant = Restaurant.new
      restaurant.menu.order_item(1, 2)
      restaurant.checkout
      restaurant.order.get_total
      expect(restaurant.order.order_total).to eq 10
    end

    it 'should inform the user if they try to checkout an empty basket' do
      restaurant = Restaurant.new
      restaurant.checkout
      expect(restaurant.order.get_total).to eq "No items in order!"
    end
  end

end
