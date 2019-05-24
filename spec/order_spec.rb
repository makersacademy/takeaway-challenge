require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new }
  context 'When ordering food' do
    before do
      order.select_dishes(:pizza, 1)
      order.select_dishes(:sausage, 1)
    end
    it 'Select dishes and add to ordered_items array' do
      expect(order.ordered_items).to eq([:pizza, :sausage])
    end
    it 'Check total for order' do
      expect(order.total).to eq(6)
    end
    it 'Confirm order is complete' do
      expect(order.place_order).to eq("Thank you! Your order was placed and will be delivered before 18:52")
    end
  end

  it 'Order is incomplete' do
    expect{order.place_order}.to raise_error("Order incomplete")
  end
end