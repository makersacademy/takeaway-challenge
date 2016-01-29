require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }

  describe '#show_menu' do

    it 'returns an empty hash' do
      allow(menu).to receive(:show).and_return({})
      expect(takeaway.show_menu).to eq ({})
    end
  end

  describe '#select' do
    it 'selects a few dishes from the menu' do
      allow(menu).to receive(:show).and_return({ ribs: 3,
      beef: 4,
      rolls: 3,
      chips: 2,
      pies: 5})
      expect(takeaway.select({beef: 2, rolls: 3}, 20)).to eq ({beef: 2, rolls: 3})

    end
  end

  describe '#correct_bill?' do

    it 'returns confirmation when the correct total is entered' do
      confirmation = "Thank you! Your order was placed and will be delivered before #{(Time.now+ 60*60).strftime("%H:%M")}"
      allow(takeaway).to receive(:send_text).with(confirmation).and_return(confirmation)
      allow(menu).to receive(:show).and_return({ ribs: 3,
      beef: 4,
      rolls: 3,
      chips: 2,
      pies: 5})
      takeaway.select({beef: 2, rolls: 3}, 17)
      expect(takeaway.correct_bill?).to eq confirmation
    end

    it 'raises and error when the incorrect total is entered' do
      
      allow(menu).to receive(:show).and_return({ ribs: 3,
      beef: 4,
      rolls: 3,
      chips: 2,
      pies: 5})
      takeaway.select({beef: 2, rolls: 3}, 24)
      expect {takeaway.correct_bill?}.to raise_error("incorrect bill amount")
    end
  end
end
