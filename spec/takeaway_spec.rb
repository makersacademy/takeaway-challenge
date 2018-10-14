require 'takeaway'
require 'basket'

describe Takeaway do

  let(:menu) { double(:menu) }
  let(:takeaway) { Takeaway.new(menu) }

  context 'describe menu' do
    before do
      allow(menu).to receive(:view).and_return("menu")
    end
    it 'prints the menu' do
      expect(takeaway.menu).to eq "menu"
    end
  end

  context 'describe order' do
    before do
      allow(menu).to receive_message_chain(:list, :has_key?).and_return(false)
    end
    it 'rasies error if a dish is ordered which is not on the menu' do
      expect { takeaway.order("Pizza") }.to raise_error "Dish unavailable"
    end
  end

  context 'describe order and review_order' do
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

end
