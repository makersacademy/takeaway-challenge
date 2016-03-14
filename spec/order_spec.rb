require 'order'

describe Order do
  let(:dish) {double(:dish, price: 5, name: :steak)}
  let(:dish2) {double(:dish2, price: 3, name: :tuna)}
  let(:menu) {double(:menu)}
  subject(:order) {described_class.new(menu)}

  before:each do 
    allow(menu).to receive(:dish_price).and_return(5)
    order.place_order(dish,2)
  end

  describe ' #initialize' do
    it ' 1. should initialize a menu' do
      expect(order.menu).to eq menu
    end
  end

  describe 'see_menu' do
    it ' 1. should access dishes of the menu' do
      expect(menu).to receive(:see_dishes)
      order.see_menu
    end
  end

  describe ' #place_order' do 

    it '1. saves a dish and its quantity' do
      expect(order.current_order.last).to include(dish, 5, 2)
    end

    it '2. returns a subtotal of the dish' do
      expect(order).to receive(:subtotal)
      order.place_order(dish,2)
    end
  end

  describe ' #subtotal' do
    
    it ' returns a subtotal of the order' do
      expect(order.summary.last[2]).to eq 10
    end
  end

  describe ' #summary' do
    it ' should list dishes with their quantity & subtotal' do
      expect(order.total[-2]).to eq [dish, 2, 10]
    end
  end

  describe ' #total' do

    it ' 1. should calculate the total order' do
      expect(order.total.last[1]).to eq 10
    end

    it ' 2. should give a suammary of the order + the total' do
      expect(order.total.last).to eq [:total, 10]
    end
  end

  describe ' #confirm_order' do

    it ' 1. should take an argument, that reps. payment' do
      expect(order).to respond_to(:confirm_order).with(1)
    end

    it ' 2. raise if too little money was paid' do
      expect{order.confirm_order(5)}.to raise_error RuntimeError
    end

    it ' 3. it should trigger a sms' do
      expect(order).to receive(:send_sms)
      order.confirm_order(10)
    end
  end

  describe ' #abort' do
    it 'should clear the current order' do 
      order.abort
      expect(order.current_order).to eq nil
    end
  end

  describe ' #delete' do
    it ' should delete a specific dish' do 
      allow(menu).to receive(:dish_price).and_return(10)
      order.place_order(dish2,6)
      order.delete(dish)

      expect(order.current_order[0][0]).to eq dish2
    end
  end

  describe ' #confirmation_number' do 
    it '1. should raise an error if it contains a string' do
      expect{order.confirmation_number('test')}.to raise_error RuntimeError
    end

    it ' it should save a number' do
      order.confirmation_number(3022030323)
      expect(order.number).to eq 3022030323
    end
  end
end
