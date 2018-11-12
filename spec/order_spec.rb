require 'order'
require 'panini'

describe Order do

  describe '#choose_items' do
    it 'returns the item, quantity and price of the item choosen' do
      expect(subject.choose_items(1, 2)).to eq "#{2} #{Menu::PANINI.values[1].keys[0]} sandwich(es) for £#{Menu::PANINI.values[1].values[0] * 2} added to your shopping cart!"
    end

    it 'returns the item, quantity and price of the item choosen' do
      allow(subject).to receive(:choose_items).and_raise("The item you choose is not on the menu")
    end
  end

  describe '#order_so_far' do
    it 'returns a total of zero' do
        expect(subject.order_so_far).to eq "Order total is £0"
    end

    it 'returns what you added so far' do
        subject.choose_items(1, 2)
        expect(subject.order_so_far).to eq "Order total is £#{Menu::PANINI.values[1].values[0] * 2}"
    end
  end

  describe '#check_total' do
    it 'returns the total amount of the order' do
      expect(subject.check_total).to eq 0
    end

    it 'returns the total amount of the order' do
      subject.choose_items(1, 2)
      expect(subject.check_total).to eq Menu::PANINI.values[1].values[0] * 2
    end

    it 'returns the total amount of the order' do
      subject.choose_items(1, 2)
      subject.choose_items(2, 3)
      expect(subject.check_total).to eq (Menu::PANINI.values[1].values[0] * 2) + (Menu::PANINI.values[2].values[0] * 3)
    end

    it 'returns the total amount of the order' do
      subject.choose_items(1, 2)
      subject.choose_items(2, 3)
      subject.check_total
      subject.choose_items(1, 1)
      expect(subject.check_total).to eq (Menu::PANINI.values[1].values[0] * 2) + (Menu::PANINI.values[2].values[0] * 3) + (Menu::PANINI.values[1].values[0])
    end
  end

  describe '#confirm' do
    it { expect(subject).to respond_to :confirm }
  end

end
