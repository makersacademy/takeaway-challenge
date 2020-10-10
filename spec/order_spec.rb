require 'order.rb'

describe Order do

  describe '#order_item' do
    let(:menu_item) { double :menu_item }

    it { is_expected.to respond_to(:order_item).with(2).argument }

    it 'adds items to the order' do
      subject.order_item(menu_item, 2)

      expect(subject.order).to eq([menu_item, menu_item])
    end

  end

end
