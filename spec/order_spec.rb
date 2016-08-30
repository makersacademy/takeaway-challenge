require 'order'

describe Order do

  subject(:order) { described_class.new(nil,0,empty_basket) }

  let(:item) { "peking duck" }
  let(:quantity) { 1 }
  let(:empty_basket) { double :basket, :ordered => {}, :total => 0, :empty? => true }
  let(:filled_basket) { double :basket, :ordered =>{"peking duck" => 1}, :total =>7.99, :empty? =>false }

  describe '#initialize' do
    it 'to create an empty basket by default' do
      expect(order.basket.empty?).to eq true
    end
  end

  describe '#create' do
    it 'creates a new order' do
      expect(order.create(item,quantity,empty_basket)).to eq({"peking duck" => 1})
    end
  end

  describe '#add' do
    it 'adds an item to the basket' do
      order.add(item,quantity,empty_basket)
      expect(filled_basket.empty?).to eq false
    end
  end

  describe '#remove' do
    it 'removes an item from the basket' do
      p empty_basket
      expect(order.remove(item,quantity,filled_basket)).to eq({})
    end
  end

end
