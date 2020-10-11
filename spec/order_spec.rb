require 'order'

describe Order do
  let(:test_menu) { double :menu }
  let(:correct_price) { 32 } 
  let(:test_takeaway) { described_class.new }

  it { is_expected.to respond_to(:add_item).with(2).arguments }

  describe '#add_item' do
    it 'adds item to order' do
      subject.add_item("California Rolls", 1)
      expect(subject.final_order).to include({ "California Rolls" => 1 })
    end
  end

  describe '#calculate_price' do
    it { is_expected.to respond_to(:calculate_price).with(1).argument }

    it 'calculates the correct price' do
      test_takeaway.add_item("California Rolls", 4)
      allow(test_menu).to receive(:menu).and_return({ "California Rolls" => 8 })
      expect(test_takeaway.calculate_price(test_menu)).to eq(correct_price)
    end
  end

end
