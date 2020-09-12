require 'order'

describe Order do

  let(:order) { Order.new }

  before(:each) do
    order.add_item("Bambi")
    order.add_item("Cheeeseburger")
  end

  describe "#add_item" do
    it 'adds an item to the order' do
      subject.add_item("Bambi")
      expect(subject.items).to eq [{ name: "Bambi", quantity: 1 }]
    end

    it 'adds two of the same item to the order' do
      subject.add_item("Cheeeseburger", 2)
      expect(subject.items).to eq [{ name: "Cheeeseburger", quantity: 2 }]
    end

    it 'adds two of the same item to the order in two steps' do
      subject.add_item("Cheeeseburger")
      subject.add_item("Cheeeseburger")
      expect(subject.items).to eq [{ name: "Cheeeseburger", quantity: 2 }]
    end

    it 'increases the total after adding an item' do
      expect { order.add_item("Bambi") }.to change { order.total }.by 8.0
    end

    it 'increases the total after adding two of the same item' do
      expect { order.add_item("Bambi", 2) }.to change { order.total }.by 16.0
    end
  end

  describe '#remove_item' do

    it 'removes an item from the order' do
      order.remove_item("Bambi")
      expect(order.items).to eq [{ name: "Cheeeseburger", quantity: 1 }]
    end

    it 'removes an item which leaves an item of the same kind behind' do
      order.add_item("Bambi")
      order.remove_item("Bambi")
      expect(order.items).to eq [{ name: "Bambi", quantity: 1 }, { name: "Cheeeseburger", quantity: 1 }]
    end

    it 'removes more than one item' do
      order.add_item("Bambi", 3)
      order.remove_item("Bambi", 2)
      expect(order.items).to eq [{ name: "Bambi", quantity: 2 }, { name: "Cheeeseburger", quantity: 1 }]
    end

    it 'removes more items than are currently on the order' do
      order.add_item("Bambi", 3)
      order.remove_item("Bambi", 7)
      expect(order.items).to eq [{ name: "Cheeeseburger", quantity: 1 }]
    end

    it 'decreases the total after removing an item' do
      expect { order.remove_item("Bambi") }.to change { order.total }.by(-8.0)
    end

    it 'decreases the total after removing two of the same item' do
      order.add_item("Bambi")
      expect { order.remove_item("Bambi", 2) }.to change { order.total }.by(-16.0)
    end
  end

  describe '#check_sum' do
    it 'checks that the total is the same as the sum of the items on the bill' do
      expect(order.check_sum).to eq true
    end

    it 'checks that the total is the same as the sum of the items on the bill #2' do
      order.add_item("Bambi", 3)
      order.add_item("Gin & Tonic", 5)
      order.add_item("Chardonnay", 2)
      order.add_item("Chardonnay", 2)
      order.add_item("Truffle Polenta Chips", 12)
      expect(order.check_sum).to eq true
    end

    it 'checks that the total is the same as the sum of the items on the bill #3' do
      order.add_item("Bambi", 3)
      order.add_item("Gin & Tonic", 5)
      order.add_item("Chardonnay", 2)
      order.add_item("Chardonnay", 2)
      order.add_item("Truffle Polenta Chips", 12)
      order.remove_item("Cheeeseburger", 7)
      order.remove_item("Gin & Tonic", 1)
      order.remove_item("Bambi", 2)
      expect(order.check_sum).to eq true
    end

    it 'checks that the total is the same as the sum of the items on the bill #4' do
      order.remove_item("Cheeeseburger", 7)
      order.remove_item("Gin & Tonic", 1)
      order.remove_item("Bambi", 2)
      expect(order.check_sum).to eq true
    end
  end
end
