# require '/lib/cart.rb'
# require './lib/order.rb'

describe Order do

  let(:order) {described_class.new}
  let(:cart) {double :cart}
  let(:selected_dish) {{:name => "Vindaloo", :price => 8, :quantity => 2}}

  # describe '#initialize' do
  #   it 'should create an order form based on the hash given by the cart' do
  #     allow(cart).to receive(:basket).and_return(selected_dish)
  #     allow(cart).to receive(:checkout).and_return(order.summary << (cart.basket))
  #     expect(order.summary).to include selected_dish
  #   end
  # end

  describe '#total' do
    it 'should create a total price based on the quantity of dishes ordered' do
      allow(cart).to receive(:basket).and_return(selected_dish)
      allow(cart).to receive(:checkout).and_return(order.summary << (cart.basket))
      expect(order.total).to eq(16)
    end
  end

end
