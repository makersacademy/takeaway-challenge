describe Takeaway do
  let(:menu) { double :menu, raw: {'Spring Rolls' => 2.99, 'Crispy Duck' => 6.99}, format: ""}
  subject(:takeaway) { Takeaway.new(menu) }

  describe '#menu' do
    it 'has a menu which can be read' do
      expect(menu).to receive(:format)
      takeaway.menu
    end
  end

  describe '#order' do
    it 'accepts an order' do
      expect(takeaway).to respond_to(:order).with(2).arguments
    end

    it 'raises error for order with unexpected dish' do
      expect{takeaway.order({'Carrot' => 99}, 666)}
        .to raise_error 'Cannot place order: Carrot not available!'
    end

    it 'checks order total matches prices in menu' do
      expect{takeaway.order({'Spring Rolls' => 2, 'Crispy Duck' => 1}, 12.97)}
        .to_not raise_error
    end

    it 'raises error if total does not match menu prices' do
      expect{takeaway.order({'Spring Rolls' => 2, 'Crispy Duck' => 1}, 12.95)}
         .to raise_error 'Cannot place order: total does not match pricing!'
    end
  end
end
