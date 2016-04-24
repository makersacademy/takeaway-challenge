require 'order'

describe Order do

  it{should respond_to(:add_to_order)}
  it{should respond_to(:show_order)}
  it{should respond_to(:check_total)}

  describe '#initialize' do
    it 'starts with empty order' do
      expect(subject.show_order).to eq({})
    end

    it 'starts with an empty total' do
      expect(subject.check_total).to be_nil
    end
  end

  describe '#add_to_order' do

    it 'adds quantity and item to order' do
      quantity = 5
      food = "anchovies"
      price_per_unit = 3.30
      subject.add_to_order(quantity,food => price_per_unit)
      expect(subject.show_order).to eq({quantity => {food => price_per_unit}})
    end
  end

  describe '#check_total' do
    it 'calculates total cost of basket' do
      quantity = 5
      food = "anchovies"
      price_per_unit = 3.30
      subject.add_to_order(quantity,food => price_per_unit)
      expect(subject.check_total).to eq(quantity * price_per_unit)
    end
  end

  describe '#complete' do
    it 'returns true if order has been processed' do
      allow(subject).to receive(:complete).and_return(true)
      subject.complete?
    end
  end
end
