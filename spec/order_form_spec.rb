require 'order_form'

describe OrderForm do
  let (:item) { double :item }

  describe '#initialize' do
    it 'should initialize a new order_hash' do
    expect(subject.order).to eq ([])
    end
  end

  describe '#add' do
    it 'should take item and add it to the order' do
      item = "muffin"
      subject.add(item)
      expect(subject.order).to eq ([{"muffin" => 3}])
    end

    it 'should take item and add it to the order' do
      item1, item2 = "muffin", "cookie"
      subject.add(item1)
      subject.add(item2)
      expect(subject.order).to eq ([{"muffin" => 3}, {"cookie" => 2}])
    end

    it 'advise if an item is not on the menu' do
      expect(subject.add("banana")).to eq "Cannot add to order: Item is not on menu."
    end

    it 'should increase the total price of the order' do
      item1, item2 = "muffin", "cookie"
      subject.add(item1)
      subject.add(item2)
      expect(subject.total_price).to eq 5
    end
  end

  describe '#remove' do
    it 'should remove items from the order' do
      item1, item2 = "muffin", "cookie"
      subject.add(item1)
      subject.add(item2)
      subject.remove(item2)
      expect(subject.order).to eq ([{"muffin" => 3}])
    end

    it 'should decrease the total price of the order' do
      item1, item2 = "muffin", "cookie"
      subject.add(item1)
      subject.add(item2)
      subject.remove(item2)
      expect(subject.total_price).to eq 3
    end
  end

  describe '#confirm_price' do
    it 'confirm if total is correct and gives total price' do
    item1, item2 = "muffin", "cookie"
    subject.add(item1)
    subject.add(item2)
    expect(subject.confirm_price).to eq "The total price for your order is $5"
    end
  end

  describe '#purchase' do
  let (:invoice) { double :invoice }
    it 'confirm if total is correct and send text if so' do
    subject.instance_variable_set(:@total_price, 10)
    allow(invoice).to receive(:total).and_return(5)
    expect(subject.purchase).to eq "Oops! Something went wrong. Please try again."
    end
  end


end
