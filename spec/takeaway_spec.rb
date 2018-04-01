require 'takeaway'

describe Takeaway do
  subject(:takeaway) {Takeaway.new}

  describe '#view_menu' do
    it 'shows the menu available' do
      expect(takeaway.view_menu).to eq({"Margharita"=> 7.00, "Pepperoni"=> 7.50, "Ham & Pineapple"=> 7.50, "Vegetarian"=> 7.00, "Meat Feast"=> 8.00})
    end
  end

  describe '#my_order' do
    context 'before any orders' do
      it { is_expected.to respond_to(:my_order) }

      it 'starts empty' do
        expect(takeaway.my_order).to be_empty
      end
    end
  end

  describe '#add_item' do
    it { is_expected.to respond_to(:add_item).with(1..2).argument }

    it 'adds an item to my order' do
      item = "Pepperoni"
      takeaway.add_item(item)
      expect(takeaway.my_order).to include(item)
    end

    it 'raises an error if the item is not on the menu' do
      message = "Sorry, that is not available on the menu"
      expect { takeaway.add_item("Chicken") }.to raise_error message
    end
  end

  describe '#remove_item' do
    it { is_expected.to respond_to(:remove_item).with(1..2).arguments }

    it 'removes an item from my_order' do
      item = "Pepperoni"
      takeaway.add_item(item, 3)
      expect { takeaway.remove_item(item, 1) }.to change {takeaway.my_order[item]}.from(3).to(2)
    end

    it 'raises an error if the quantity removed is more than the quantity in my_order' do
      message = "Sorry, you can't remove more than you've ordered"
      item = "Pepperoni"
      takeaway.add_item(item)
      expect { takeaway.remove_item(item, 2) }.to raise_error message
    end

    it 'raises an error if the item is not in my_order' do
      message = "Sorry, the item selected is not in your order"
      item = "Pepperoni"
      expect { takeaway.remove_item("Pepperoni") }.to raise_error message
    end
  end

  describe '#order_total' do
    it { is_expected.to respond_to(:order_total) }
    it 'shows the total value of the order' do
      item = "Pepperoni"
      subject.add_item(item, 2)
      expect(subject.order_total).to eq 15.00
    end
  end

  describe '#item_total' do
    it { is_expected.to respond_to(:item_total) }
    it 'returns the combined total for items on the order' do
      item = "Pepperoni"
      expect(takeaway.item_total(item, 3)).to eq 22.50
    end
  end

  describe '#display_order' do
      it 'returns a printed list of the items on your order and their subtotals' do
        takeaway.add_item("Pepperoni", 2)
        takeaway.add_item("Vegetarian")
        expect(takeaway.display_order).to eq "Pepperoni x2 = £15.00, Vegetarian x1 = £7.00"
      end
  end


end
