require 'menu'
require 'order'

describe Menu do

  context 'when initialize' do

    it 'should have item selected is nil' do
      expect(subject.item_selected).to eq nil
    end

    it 'should create an instance of an order' do
      expect(subject.order).to eq subject.order
    end

  end

  context 'view' do

    it 'should display a list of dishes with prices' do
      expect(subject.view).to eq subject.items
    end

  end

  context 'when add' do

    it 'should add item to an order' do
      subject.add(1)
      expect(subject.order.order).to eq [subject.item_selected]
    end

    it 'should show the total of the order' do
      subject.add(1)
      subject.add(2)
      expect(subject.order.total).to eq 18
    end

    it 'should raise an error if the total is wrong' do
      order = double("order", :total => 9)
      subject.add(1)
      subject.add(2)
      expect{ subject.check_total }.to raise_error "Wrong total"
    end

  end

  context 'when delete' do

    it 'should delete item from order' do
      subject.add(1)
      subject.delete(1)
      expect(subject.order.order).to eq []
    end

    it 'should show the total of the order' do
      subject.add(1)
      subject.add(2)
      subject.delete(1)
      expect(subject.order.total).to eq 9
    end

  end

end
