require 'order'

describe Order do

  let(:name) { double :name }
  let(:quantity) { double :quantity }

  describe '#order_item' do

    it { is_expected.to respond_to(:order_item).with(2).arguments }

    it { is_expected.to respond_to(:basket) }

    it 'adds order to @basket' do
      subject.order_item("燃面", 1)
      expect(subject.basket[0]).to include(:name, :quantity, :item_total)
      # expect {subject.order_item(id, quantity)}.to change {subject.basket.length}.by 1
    end

  end

  describe '#displays total basket cost' do

    it { is_expected.to respond_to(:basket_total) }

    it 'adds up the value of all the items in the basket' do
      subject.order_item("燃面", 2)
      subject.order_item("饺子", 3)
      subject.order_item("辣子鸡", 2)
      expect(subject.basket_total).to eq(53)
    end

  end
end
