require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double(:menu, :dishes => {"chicken burger": 3.49, "chicken wings": 4.99}, :print_dishes => "chicken burger: 3.49, chicken wings: 4.99") }
  let(:full_order) { double(:order, :list => {:"chicken wings"=>2, :"chicken burger"=>3})}
  before(:each) do
    takeaway.instance_variable_set(:@menu, menu)
  end

  describe '#show_menu' do
    it 'shows the list of dishes with prices' do
      expect(takeaway.show_menu).to eq "chicken burger: 3.49, chicken wings: 4.99"
    end
  end

  describe '#add_to_order' do
    it 'raises an exception if the dish passed is not on the menu' do
      expect{ takeaway.add_to_order("egg fried rice") }.to raise_error("Sorry, that item is not on the menu")
    end

    it 'prints a message saying what was added to the order' do
      expect(takeaway.add_to_order("chicken wings", 2)).to eq "2x chicken wings successfully added to your order"
    end
  end

  describe '#checkout' do
    before do
      takeaway.add_to_order("chicken wings", 2)
      takeaway.add_to_order("chicken burger", 3)
      takeaway.instance_variable_set(:@basket, full_order)
    end

    it 'confirms the order is complete' do
      allow(full_order).to receive(:try_complete).with(20.45).and_return true
      expect(takeaway.checkout(20.45)).to eq "Order placed - please see your mobile for delivery details"
    end

    it 'raises an error if given amount is incorrect' do
      allow(full_order).to receive(:try_complete).with(20.46).and_return false
      expect{ takeaway.checkout(20.46) }.to raise_error "Sorry, that amount does not match your order total, please try again"
    end
  end

  describe 'Feature tests' do

    describe '#basket_summary' do
      before do
        takeaway.add_to_order("chicken burger")
        takeaway.add_to_order("chicken wings", 2)
      end

      it 'shows the basket summary with totalled up prices' do
        expect(takeaway.basket_summary).to eq "chicken burger x1 = 3.49, chicken wings x2 = 9.98"
      end
    end

    describe '#total' do
      it 'shows the total price of current order' do
        takeaway.add_to_order("chicken wings", 2)
        expect(takeaway.total).to eq "9.98"
        takeaway.add_to_order("chicken burger", 3)
        expect(takeaway.total).to eq "20.45"
      end
    end
  end
end
