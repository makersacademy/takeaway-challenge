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

  describe '#print_order' do
    it 'should allow users to see a list of the dishes they have selected and the total price' do
      allow(cart).to receive(:basket).and_return(selected_dish)
      allow(cart).to receive(:checkout).and_return(order.summary << (cart.basket))
      expect {order.print_order}.to output("You have ordered:\nVindaloo x2\nThe total is £16\n").to_stdout
    end
  end

  describe '#confirm' do

    it 'should allow the user to confirm their order' do
      allow(order).to receive(:confirmed).and_return(true)
      allow(order).to receive(:gets).and_return("Y\n")
      expect{order.confirm}.to output("You have ordered:\nThe total is £0\nConfirm order? (Y/N)\nThank you for confirming your order. You can now send it.\n").to_stdout
    end

  end

end
