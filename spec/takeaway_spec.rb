require 'takeaway'
require 'basket'
require 'text'
require 'pry'

describe Takeaway do

  let(:menu) { double(:menu) }
  let(:current_basket) { double(:current_basket) }
  let(:sms) { double(:sms) }
  let(:takeaway) { Takeaway.new(menu, current_basket, sms) }

  context 'Describe #menu:' do
    before do
      allow(menu).to receive(:view).and_return("menu")
    end
    it 'prints the menu' do
      expect(takeaway.menu).to eq "menu"
    end
  end

  context 'Describe #order:' do
    before do
      allow(menu).to receive_message_chain(:list, :has_key?).and_return(false)
    end
    it 'rasies error if a dish is ordered which is not on the menu' do
      expect { takeaway.order("Pizza") }.to raise_error "Dish unavailable"
    end
  end

  context 'Describe #order and #review_order:' do
    it 'adds boiled rice to the basket' do
      real = Takeaway.new
      real.order("Boiled Rice")
      expect(real.review_order).to eq "Boiled Rice, £2\nTotal: £2"
    end

    it 'adds boiled rice and satay chicken to the basket ' do
      real = Takeaway.new
      real.order("Boiled Rice")
      real.order("Satay Chicken")
      expect(real.review_order).to eq "Boiled Rice, £2\nSatay Chicken, £6\nTotal: £8"
    end
  end

  context 'Describe #place_order:' do
    before do
      allow(current_basket).to receive(:total).and_return 2
    end
    it 'rasies an error message if the total inputted by user does not match basket total' do
      expect { takeaway.place_order(4) }.to raise_error "Incorrect total"
    end
    it 'confirms order has been placed' do
      allow(sms).to receive(:text)
      expect(takeaway.place_order(2)).to eq "Your order has been place. You will recieve a confirmation text shortly."
    end
  end

end
