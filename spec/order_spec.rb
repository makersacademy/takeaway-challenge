require 'order'

describe Order do

  let(:dish1){double(:dish1, name: "Dishy1", price: 1.11)}
  let(:dish2){double(:dish2, name: "Dishy2", price: 2.22)}
  let(:menu){double(:menu, select: dish1)}

  describe '#place_order' do
    it 'calls the menu#select method' do
      expect(menu).to receive(:select)
      subject.place_order(menu, 1, 2)
    end

    it 'given the menu, dish number and quantity adds the dish/dishes to the order' do
      # allow(menu).to receive(:select){dish1}
      subject.place_order(menu, 1, 2)
      expect( subject.basket.count(dish1) ).to eq 2
    end
  end

end
