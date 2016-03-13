require 'takeaway'

describe Takeaway do

  let(:basket_class) { double(:basket_class, new: basket) }
  let(:basket) { double(:basket, add: nil, remove: nil, calc_total: 35) }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu, find_price: 7) }

  let(:priced_dish1) { {name: 'sushi', amount: 5, price: 7} }
  subject(:takeaway) { described_class.new(basket_class, menu_class) }

  describe '#initialize' do
    before(:each) do
      takeaway
    end
    it '0.0 initilizes with a new instance of basket' do
      expect(basket_class).to have_received(:new)
    end
    it '0.1 initilizes with a new instance of menu' do
      expect(menu_class).to have_received(:new)
    end
  end

  describe '#add' do
    it '1.0 calls add method on basket with priced dish' do
      expect(takeaway.basket).to receive(:add)
      takeaway.add('sushi', 5)
    end
  end

  describe '#remove' do
    it '2.0 calls remove method on basket with priced dish' do
      expect(takeaway.basket).to receive(:remove)
      takeaway.remove('sushi', 5)
    end
  end

  describe '#place_order' do
    before(:each) do
      takeaway.add('sushi', 5)
    end
    it '3.0 calls calc_total on basket' do
      expect(takeaway.basket).to receive(:calc_total)
      takeaway.place_order(35)
    end
    it '3.1 raises an error if given total is incorrect' do
      message = 'Re-calculate and enter correct total'
      expect{takeaway.place_order(30)}.to raise_error message
    end
  end

end
