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

  end

  context 'when delete' do

    it 'should delete item from order' do
      subject.add(1)
      subject.delete(1)
      expect(subject.order.order).to eq []
    end

  end

end
