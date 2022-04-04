require_relative '../lib/order.rb'

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
      expect { my_order.add_dish('fries') }.to change { my_order.basket }.from(Hash.new(0)).to({ 'fries' => 2 })
    end

    it 'stores a dish in the order' do
      my_order.add_dish('fries')
      expect(my_order.basket).to include('fries')
    end
  end

  describe '#remove_dish' do
    it 'removes a dish from the order' do
      my_order.add_dish('Hummus')
      expect { my_order.remove_dish('Hummus') }.to change { my_order.basket['Hummus'] }.from(3).to(0)
    end

    it 'raises an error if dish not in the basket' do
      my_order.add_dish('shawarma')
      msg = 'Item not in the basket!'
      expect { my_order.remove_dish('fries') }.to raise_error msg
    end
  end


    it 'raises an error if basket is empty' do
      msg = "Your basket is currently empty. Please add item first."
      expect { my_order.view_basket }.to raise_error msg
    end
  end

  describe '#place_order' do
    
    let(:text) { double :text, send_message: "Thank you for your order!" }

    it 'confirms the order was successful if the payment equals the total' do
      my_order.add_dish('fries')
      my_order.add_dish('Falafel')
      expect(my_order.place_order(7, text)).to eq "Thank you for your order!"
    end

    it 'raises an error if basket is empty' do
      msg = "Your basket is currently empty. Please add item first."
      expect { my_order.place_order(2) }.to raise_error msg
    end

    it 'raises an error if payment is not equal to the total' do
      my_order.add_dish('Pizza')
      msg = "Please enter the correct payment amount."
      expect { my_order.place_order(2) }.to raise_error msg
    end
  end

