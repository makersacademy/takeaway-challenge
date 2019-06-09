require 'order'

describe Order do
  describe '#add_item' do
    it 'adds item and quantity to order array' do
      expect { subject.add_item("rice", 6) }.
      to change { subject.order.count }.by(1)
    end
  end

  describe '#print_order' do
    it 'returns order as a string' do
      item1 = double('item', name: 'Cake')
      item2 = double('item', name: 'Toastie')
      subject.add_item(item1, 6)
      subject.add_item(item2, 3)
      expect(subject.print_order).to eq("6 - Cake(s)\n3 - Toastie(s)")
    end
  end

  describe '#total' do
    it 'returns total as a string' do
      item1 = double('item', name: 'Cake', price: 6)
      item2 = double('item', name: 'Toastie', price: 8)
      subject.add_item(item1, 6)
      subject.add_item(item2, 3)
      expect(subject.total).to eq("Your total is £60")
    end
  end

end
