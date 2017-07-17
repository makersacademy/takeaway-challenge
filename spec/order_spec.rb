require 'order'


describe Order do
  subject(:order) {Order.new}
  describe '#print_menu' do
    it 'should print the list of meals' do
      expect(order.print_menu).to eq "Pig's.brain is at £8
Rosted.frog is at £10
Camel.Curry is at £11.5
Dolphin.salami is at £12.5
Battered.axololt is at £5.5"
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
      order.add_to_basket("Pig's.brain")
      expect(order.total).to eq "£8"
    end
  end

  describe '#summary' do

    it 'should print the summary of orders' do
      order.add_to_basket("Pig's.brain", "Rosted.frog")
      expect(order.summary).to eq "Pig's.brain, Rosted.frog"
    end
  end

  describe '#place_order' do

    it 'should place the order' do
    order.add_to_basket("Pig's.brain")
    allow(order).to receive(:send_message).with("Pig's.brain")

    expect(order.place_order(8)).to eq "Order placed - please see text message for delivery details"
    end
    it 'should raise an error if amout not equal' do
    order.add_to_basket("Pig's.brain")
    expect{ order.place_order(7) }.to raise_error
    end
  end
end
