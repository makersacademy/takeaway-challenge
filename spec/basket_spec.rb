require 'basket'

describe Basket do
  it 'items is empty after initialize' do
    puts subject.items
    expect(subject).to be_empty
  end

  describe '#add' do
    before(:each) { subject.add("test item", 1) }
    context 'add new item with quantity' do
      it 'should append new item with quantity' do
        expect(subject.items).to eq [{ "item" => "test item", "qty" => 1 }]
      end
    end

    context 'add existing item with quantity' do
      it 'should update item with quantity' do
        subject.add("test item", 1)
        expect(subject.items).to eq [{ "item" => "test item", "qty" => 2 }]
      end
    end
  end

  describe '#delete' do
    before(:each) { subject.add("test 1", 1) }
    before(:each) { subject.add("test 2", 2) }
    context 'when remove item not in basket' do
      it 'raise error' do
        expect { subject.delete("test 3") }.to raise_error("item not in basket")
      end
    end

    context 'when remove item with more than existing quantity' do
      it 'raises error' do
        expect { subject.delete("test 1", 2) }.to raise_error("invalid quantity")
      end
    end

    context 'when remove item with full quantity' do
      it 'remove item' do
        subject.delete("test 1", 1)
        expect(subject.items).to eq [{ "item" => "test 2", "qty" => 2 }]
      end
    end

    context 'when remove item with partial quantity' do
      it 'reduces quantity' do
        subject.delete("test 2", 1)
        expect(subject.items).to eq [{ "item" => "test 1", "qty" => 1 }, { "item" => "test 2", "qty" => 1 }]
      end
    end
  end

  describe '#view' do
    it 'not empty' do
      expect(subject.view).to_not be_empty
    end
  end

  describe '#clear' do
    it 'should clear items' do
      subject.add("should be cleared")
      subject.clear
      expect(subject).to be_empty
    end
  end

  describe '#item_qty' do
    context 'when item not in basket' do
      it 'should be 0' do
        expect(subject.item_qty("test not in basket")).to eq 0
      end
    end

    context 'when item in basket' do
      it 'should be 0' do
        subject.add("test in basket", 2)
        expect(subject.item_qty("test in basket")).to eq 2
      end
    end
  end

  describe '#total_price' do
    context 'when basket is empty' do
      it 'should be 0' do
        expect(subject.total_price).to eq 0
      end
    end

    context 'when basket is not empty' do
      it 'should add up all price * qty' do
        subject.add({"id" => "1", "name" => "dish 1", "price" => "5"}, 2)
        subject.add({"id" => "2", "name" => "dish 2", "price" => "6"}, 2)
        expect(subject.total_price).to eq 22
      end
    end
  end
end