require 'takeaway'

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


end
