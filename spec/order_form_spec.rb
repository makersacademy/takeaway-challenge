require 'order_form'

describe OrderForm do

  describe '#initialize' do
    it 'should initialize a new order_hash' do
    expect(subject.order).to eq ([])
    end
  end

  describe '#print_menu' do
    it 'should print a list of menu items and their prices' do
      expect { subject.print_menu }.to output.to_stdout
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
  end

  describe '#remove' do
    it 'should remove items from the order' do
      item1, item2 = "muffin", "cookie"
      subject.add(item1)
      subject.add(item2)
      subject.remove(item2)
    expect(subject.order).to eq ([{"muffin" => 3}])
    end
  end

  describe '#purchase' do
    it 'confirm if total is correct and send confirmation text' do
      item1, item2 = "muffin", "cookie"
      subject.add(item1)
      subject.add(item2)
      
    expect(subject.purchase).to eq false
    end
  end


end
