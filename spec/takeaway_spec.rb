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
      expect(takeaway.order).to eq "menu"
    end
  end

  context 'describe add_to_basket' do
    it 'adds boiled rice to the basket' do
      real = Takeaway.new
      real.add_to_basket("Boiled Rice")
      expect
    end
  end


end
