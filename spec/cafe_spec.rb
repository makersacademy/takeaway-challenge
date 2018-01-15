require 'cafe'

describe Cafe do

  let(:messager) { double :messager }
  let(:order) { double :order }
  let(:menu) { double :menu }
  subject(:cafe) { described_class.new(menu, order, messager) }

  describe 'menu retrieval' do
    it 'requests menu' do
      expect(menu).to receive(:show)
      expect(cafe.read_menu).to eq "What would you like to order?"
    end
  end

  describe 'order' do
    it 'confirms order' do
      allow(menu).to receive(:includes?).with("CHIA_PUDDING").and_return true
      allow(order).to receive(:add_to_order).with("CHIA_PUDDING", 1)
      expect(cafe.order_me("CHIA_PUDDING")).to eq "You have added CHIA_PUDDING x1."
    end

    it 'raises error if item not listed' do
      allow(menu).to receive(:includes?).with("cereal").and_return false
      expect { cafe.order_me("cereal") }.to raise_error('This item is not on the menu.')
    end

    it 'states what was ordered with item multiples' do
      allow(menu).to receive(:includes?).with("BANANA_BREAD").and_return true
      allow(order).to receive(:add_to_order).with("BANANA_BREAD", 2)
      expect(cafe.order_me("BANANA_BREAD", 2)).to eq "You have added BANANA_BREAD x2."
    end
  end

  describe 'summary' do
    it 'summarises the order' do
      allow(order).to receive(:summary)
      cafe.basket_summary
    end
  end

  describe '#checkout' do
    it 'provides a correct total' do
      allow(menu).to receive(:includes?).with("BANANA_BREAD").and_return true
      allow(order).to receive(:add_to_order).with("BANANA_BREAD", 2)
      cafe.order_me("BANANA_BREAD", 2)
      expect(messager).to receive(:confirm_order_by_text)
      allow(order).to receive(:check).with(11).and_return true
      allow(order).to receive(:total).and_return 11
      cafe.checkout(11)
    end

    it 'checks balance at checkout' do
      allow(menu).to receive(:includes?).with("BANANA_BREAD").and_return true
      allow(order).to receive(:add_to_order).with("BANANA_BREAD", 2)
      cafe.order_me("BANANA_BREAD", 2)
      allow(order).to receive(:total).and_return 11.0
      allow(order).to receive(:check).with(8).and_return false
      expect { cafe.checkout(8) } .to raise_error "Please pay the correct amount of £11.0."
    end
  end

end
