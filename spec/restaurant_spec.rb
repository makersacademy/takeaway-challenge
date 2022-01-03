require 'restaurant'

describe Restaurant do
  let(:basket) { double :basket, total: "£18.50" }
  context "menu" do
    it 'has a menu with prices' do
      expect(subject.menu).to eq([
        {'bibimbap'=>10.50},
        {'bulgogi'=>10.00},
        {'naengmyeon'=>8.00}
      ])
    end
    it 'prints the menu for the customer' do
      expect(subject.see_menu).to eq( {'bibimbap'=>"£10.50",
        'bulgogi'=>"£10.00",
        'naengmyeon'=>"£8.00"})
    end
    describe "#select_item" do
      it 'returns an item and its price as a hash' do
        expect(subject.select_item('bibimbap')).to eq('bibimbap'=>10.5) 
      end
    end
  end
  describe "#confirm" do
    it 'confirms the order and sends a text' do
      allow(subject).to receive(:place_order)
      expect(subject).to receive(:place_order).with(basket.total)
      subject.place_order(basket.total)
    end
  end
end