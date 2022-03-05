require 'order'

describe Order do
  subject(:my_order) { described_class.new }

  it 'can create an Order' do
    expect(my_order).to be_a_kind_of(Order)
  end

  it 'has a default empty hash to store the order' do
    expect(my_order.basket).to eq Hash.new(0)
  end

  describe '#add_dish' do
    it 'adds an available dish to order' do
      expect { my_order.add_dish('Pasta') }.to change { my_order.basket }.from(Hash.new(0)).to({ 'Pasta' => 12 })
    end

    it 'stores a dish in the order' do
      my_order.add_dish('Pizza')
      expect(my_order.basket).to include('Pizza')
    end
  end

  describe '#remove_dish' do
    it 'removes a dish from the order' do
      my_order.add_dish('Burger')
      expect { my_order.remove_dish('Burger') }.to change { my_order.basket['Burger'] }.from(13).to(0)
    end

    it 'raises an error if dish not in the basket' do
      my_order.add_dish('Burger')
      msg = 'Item not in the basket!'
      expect { my_order.remove_dish('Paella') }.to raise_error msg
    end
  end

  describe '#view_basket' do
    it 'prints the items in the basket with quantities and prices and the total' do
      my_order.add_dish('Olives')
      my_order.add_dish('Steak')
      expect { my_order.view_basket }.to output(<<-output
1x Olives £2.5
1x Steak £20
----------------
Order Total £22.5
output
      ).to_stdout
    end
  end

  describe '#place_order' do
    it 'confirms the order was successful if the payment equals the total' do
      my_order.add_dish('Pizza')
      my_order.add_dish('Pizza')
      expect(my_order.place_order(20)).to eq "Thank you for your order!"
    end

    it 'raises an error if payment is not equal to the total' do
      my_order.add_dish('Pizza')
      msg = "Please enter the correct payment amount."
      expect { my_order.place_order(2) }.to raise_error msg
    end
  end
end
