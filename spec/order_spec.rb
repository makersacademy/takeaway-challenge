require 'order'

describe Order do

  describe '#add_item' do

    it 'responds to one to two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end

    before do
      subject.add_item("Chicken Teriyaki")
    end

    it 'adds an item to the order list' do
      expect(subject.list.count).to eq 1
    end

    it 'adds a quantity of one by default' do
      expect(subject.list.last[:quantity]).to eq 1
    end

  end
end
