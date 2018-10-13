require 'rspec'
require_relative '../lib/order'

describe Order do
  subject(:order){described_class.new}
  describe '#new' do
    it 'should create a new order object' do
      expect(described_class).to eq(Order)
    end
  end
  describe '#add_item' do
    context 'where the item is already present in items' do
      it 'should increase the quantity of the item' do

      end
    end
    context 'where the item does not already exist in items' do
      it 'should add the item to items with a value of one' do

      end
    end
  end

  describe '#remove_item' do
    context 'where the item has a value of one' do
      it 'should remove the item from the items' do

      end
    end
    context 'where the item has value greater than one' do
      it 'should decrease the value of the item by one' do

      end
    end
  end

  describe '#items' do
    context 'where it has some items stored' do
      it 'should return a hash of items' do

      end
    end
    context 'where it has no items stored' do
      it 'should return a empty hash of items' do

      end
    end
  end
end