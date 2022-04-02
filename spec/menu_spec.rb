require_relative '../lib/menu'

describe Menu do

  context '#initialize' do
    it 'create an empty array at the start' do
      expect(subject.full_list).to eq []
    end
  end

  context 'let you add items' do
    it { is_expected.to respond_to(:add_item).with(2).arguments }

    it 'will add an item and its price'do
      subject.add_item("Rice",4)
      expect(subject.full_list).to eq [{item: "Rice", price: 4}]
    end
  end
end
