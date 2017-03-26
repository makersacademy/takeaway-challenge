require './lib/menu.rb'
require './lib/order.rb'

describe Cart do

  let(:cart) {described_class.new}
  let(:menu) {double :menu}
  let(:curry) {double :dish, :name => "Vindaloo", :price => 8}
  let(:selected_dish) {{:name => "Vindaloo", :price => 8, :quantity => 2}}
  let(:order) {double :order}

  describe '#add_to_basket' do

    it 'adds the selected dishes to the basket in the quantity specified ' do
      cart.add_to_basket(curry, 2)
      expect(cart.basket).to include ({:name =>"Vindaloo", :price =>8, :quantity => 2})
    end

  end

  describe '#checkout' do

    it 'creates an order form based on the dishes added to basket' do
      allow(Order).to receive(:new).and_return(order)
      allow(order).to receive(:summary).and_return ([])
      cart.add_to_basket(curry, 2)
      cart.checkout
      expect(order.summary).to eq([selected_dish])
    end

  end


end
