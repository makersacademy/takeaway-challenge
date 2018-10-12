require 'order_form'

describe OrderForm do

  describe '#initialize' do
    it 'should initialize a new order_hash' do
    expect(subject.order).to eq ([])
    end
  end

  describe '#select_item' do
    it 'should take item and add it to the order' do
      item = "muffin"
      subject.add_to_order(item)
      expect(subject.order).to eq ([{"muffin" => 3}])
    end

    it 'should take item and add it to the order' do
      item1, item2 = "muffin", "cookie"
      subject.add_to_order(item1)
      subject.add_to_order(item2)
      expect(subject.order).to eq ([{"muffin" => 3}, {"cookie" => 2}])
    end
  end

end
