require 'order'

describe Order do
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:total) { double :total }
  subject { Order.new(dish, quantity, total) }

  it 'creates an Order instance' do
    expect(subject).to be_instance_of(Order)
  end

  context 'adding order item' do
    it 'stores a dish name' do
      expect(subject.dish).to eq(dish)
    end

    it 'stores a dish quantity' do
      expect(subject.quantity).to eq(quantity)
    end

    it 'stores a total for each dish' do
      expect(subject.total).to eq(total)
    end
  end
end
