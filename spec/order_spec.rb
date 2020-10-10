require 'order'

describe Order do
  it { is_expected.to respond_to(:add_item).with(2).arguments }

  describe '#add_item' do
    it 'adds item to order' do
      subject.add_item("California Rolls", 1)
      expect(subject.order).to include({ "California Rolls" => 1 })
    end
  end
end
