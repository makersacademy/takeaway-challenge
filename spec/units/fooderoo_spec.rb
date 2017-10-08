require 'fooderoo'

describe Fooderoo do
  subject(:fooderoo) { described_class.new }
  describe '#initialize' do
    it 'creates and stores a menu' do
      expect(fooderoo.menu).to be_a Menu
    end
    it 'creates and stores an order' do
      expect(fooderoo.order).to be_a Order
    end
  end
  describe '#show_menu' do
    it 'returns a string' do
      expect(fooderoo.show_menu).to be_a String
    end
  end
  describe '#select' do
    it 'returns an array' do
      expect(fooderoo.select 'Pizza Diavola', 2).to be_a Array
    end
  end
end
