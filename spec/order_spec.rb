require 'order.rb'

describe Order do

  describe '#order_item' do
    let(:menu_item) { double :menu_item }

    it { is_expected.to respond_to(:order_item).with(2).argument }

    it 'adds items to the order' do
      subject.order_item(menu_item, 2)

      expect(subject.items).to eq([menu_item, menu_item])
    end
  end

  describe '#total_price' do
    let(:menu_item) { double :menu_item }
    before do
      allow(menu_item).to receive(:price).and_return(10)
    end

    it ' gives total price of the order' do
      subject.order_item(menu_item, 2)

      expect(subject.total_price).to eq(20)
    end

    it 'change total_price after ordering item' do
      subject.order_item(menu_item, 2)

      expect { subject.order_item(menu_item, 1) }.to change { subject.total_price }.by(10)
    end

  end

end
