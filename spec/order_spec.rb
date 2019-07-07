require 'order'



describe Order do

  let(:dish1) { double :dish1 }
  let(:quantity) { double :quantity }

  describe '#order' do
    it 'when user orders a meal the details are stored' do
      order = Order.new(dish1, quantity)
      order.order
      expect(order.order_details.length). to eq 1
    end
    it 'checks if the food ordered is available' do

    end

  end

  describe '#confirm_order' do
    it 'when user orders a meal, the user receives a list of the items ordered and the total price' do

    end
  end
end
