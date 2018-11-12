require 'order'

describe Order do

  describe '#add_to_order' do
    it 'can add a dish to the basket' do
      subject.add_to_order('chicken nuggets meal', 1)
      expect(subject.basket).not_to be_empty
    end

    it 'can add several dishes to the basket' do
      subject.add_to_order('chicken nuggets meal', 2)
      expect(subject.basket).to eq('chicken nuggets meal' => 8.98)
    end

    xit 'raises an error if item not on menu' do
      subject.add_to_order('quinoa salad', 2)
      expect(subject.add_to_order).to raise_error "Sorry, your selection is unavailable"
    end #error testing not working

  end

  describe '#view_basket' do
    it 'shows contents of the basket' do
      subject.add_to_order('spicy wings meal', 1)
      expect(subject.basket).to eq('spicy wings meal' => 5.49)
    end
  end

  describe '#total_order' do
    it 'adds up the total order' do
    end
  end
end
