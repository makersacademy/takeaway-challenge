require 'order'

describe Order do

  it 'Should have a takeaway class' do
    expect(Order).to respond_to(:new)
  end

  describe '#view' do
    it 'Should show items that can be ordered' do
      expect{subject.view}.to output.to_stdout
    end
  end

  describe '#order' do
    it 'Should have an order menthod to place order' do
      expect(subject).to respond_to(:order)
    end

    it 'Should save items and prices when selecting an item number' do
      subject.order(1, 1)
      expect(subject.current_order).to eq([{ item: "Spare ribs", price: 5.99 }])
    end

    it 'Should save multiple items when given a second argument' do
      subject.order(2, 3)
      expect(subject.current_order).to eq([{ item: "Spring rolls", price: 3.50}, { item: "Spring rolls", price: 3.50 }, { item: "Spring rolls", price: 3.50 }])
    end
  end

  describe '#total' do
    it 'Should return the order total when asked' do
      subject.order(1, 2)
      expect { subject.total }.to output("Spare ribs: 5.99\nSpare ribs: 5.99\ncurrent order total is £11.98\n").to_stdout
    end
  end
end
