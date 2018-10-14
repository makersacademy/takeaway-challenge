require 'takeaway'
require 'basket'

describe Takeaway do

  let(:menu) { double(:menu) }
  let(:takeaway) { Takeaway.new(menu) }

  context 'describe order' do
    before do
      allow(menu).to receive(:view).and_return("menu")
    end
    it 'prints the menu' do
      expect(takeaway.menu).to eq "menu"
    end
  end

  context 'describe order' do
    it 'adds boiled rice to the basket' do
      real = Takeaway.new
      real.order("Boiled Rice")
      expect(takeaway.review_order).to eq "Boiled Rice, £2.\nTotal: £2"
    end
  end


end
