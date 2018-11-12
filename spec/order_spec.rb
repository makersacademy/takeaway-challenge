require 'order'

describe Order do

  describe '#add_order' do
    it 'can add a dish to the basket' do
      subject.add_order('chicken nuggets meal', 1)
      expect(subject.basket).not_to be_empty
    end

    it 'can add several dishes to the basket' do
      subject.add_order('chicken nuggets meal', 2)
      expect(subject.basket).to eq('chicken nuggets meal' => [4.49, "x2"])
    end
  end

  describe '#view_basket' do
    it 'shows contents of the basket' do
      subject.add_order('spicy wings meal', 1)
      expect(subject.basket).to eq('spicy wings meal' => [5.49, "x1"])
    end
  end
end
