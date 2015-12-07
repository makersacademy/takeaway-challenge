require 'takeaway'

describe Takeaway do
  let(:order) do 
    double :order, as_hash: {'Spring Rolls' => 2, 'Crispy Duck' => 1},
      total: 12.97
  end
  let(:order_klass) { double :order_klass, new: order }
  let(:carrot_order) { double :order, as_hash: {'Carrot' => 99} }
  let(:carrot_order_klass) { double :order_klass, new: carrot_order }

  let(:phone) { double :phone, complete_order: nil }
  let(:menu) do 
    double :menu, raw: {'Spring Rolls' => 2.99, 'Crispy Duck' => 6.99},
      format: ''
  end
  subject(:takeaway) { described_class.new(menu, order_klass, phone) }

  describe '#menu' do
    it 'has a menu which can be read' do
      expect(menu).to receive(:format)
      takeaway.menu
    end
  end

  describe '#order' do
    it 'accepts an order' do
      expect(takeaway).to respond_to(:place_order).with(2).arguments
    end

    it 'raises error for order with unexpected dish' do
      takeaway = described_class.new(menu, carrot_order_klass, phone)
      expect{takeaway.place_order('99 Carrot', 666)}.
        to raise_error 'Cannot place order: Carrot not available!'
    end

    it 'checks order total matches prices in menu' do
      expect{takeaway.place_order('2 Spring Rolls, 1 Crispy Duck', 12.97)}.
        to_not raise_error
    end

    it 'raises error if total does not match menu prices' do
      expect{takeaway.place_order('2 Spring Rolls, 1 Crispy Duck', 12.95)}.
        to raise_error 'Cannot place order: total does not match pricing!'
    end
  end
end
