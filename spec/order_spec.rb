require 'order'

describe Order do

  subject(:order) { described_class.new [{ dish: "Fries", quantity: 2, price: 10 }, { dish: "Pizza", quantity: 1, price: 6 }] }

  describe '#initialize' do
    it 'order isnt empty upon initialization' do
      expect(subject.current_order.count).to eq 2
    end
  end

  describe '#print_order' do
    it 'prints final order' do
      expect(subject.print_order).to eq "Summary of your order: Fries 2x, Pizza 1x, total price £16"
    end
  end

  describe '#total_price_calculation' do
    it 'calculates the total price of the order' do
      subject.total_price_calculation
      expect(subject.total_price).to eq 16
    end
  end

  describe '#confirm_order' do
    it 'confirms order when requested' do
      expect(subject.confirm_order).to eq "Order confirmed!"
    end
    it 'raises error if total price is not correct' do
      allow(subject).to receive(:calculated_price) {8}
      expect {subject.confirm_order}.to raise_error "The total amount is not correct, please order again."
    end
    it 'checks price by summing individual prices' do
      subject.price_check
      expect(subject.calculated_price).to eq 16
    end
  end
end
