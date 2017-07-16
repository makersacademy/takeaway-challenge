require 'order'


describe Order do
  subject(:order) {Order.new}
  describe '#print_menu' do
    it 'should print the list of meals' do
      expect(order.print_menu).to eq "Margherita is at £8
Pepperoni is at £10
Spiced Salami is at £11.5
Carbonara is at £12.5
Tiramisu is at £5.5"
    end
  end

  # describe '#add_to_basket' do
  #   it 'add to basket' do
  #   basket = double("Basket")
  #   expect(basket).to receive(:add_summary).with("Margherita")
  #   order.add_to_basket("Margherita")
  #   end
  # end

  describe '#total' do

    it 'should print the correct total' do
      order.add_to_basket("Margherita")
      expect(order.total).to eq "£8"
    end
  end

  describe '#summary' do

    it 'should print the summary of order' do
      order.add_to_basket("Margherita", "Tiramisu")
      expect(order.summary).to eq "Margherita, Tiramisu"
    end
  end

  describe '#place_order' do

    it 'should place the order' do
    order.add_to_basket("Margherita")
    allow(order).to receive(:send_message).with('Margherita')

    expect(order.place_order(8)).to eq "Order placed - please see text message for delivery details"
    end
  end
    it 'should raise an error if amout not equal' do
    order.add_to_basket("Margherita")
    expect{ order.place_order(7) }.to raise_error
  end
end
