require 'order'

describe Order do

subject(:order){ described_class.new }
let(:an_order){ spy :an_order }
let(:another_order){ spy :another_order }
let(:messenger){ double :messenger }

  it 'has somewhere to store orders' do
    expect(order.check_order).to be_an Array
  end

  describe '#check_order' do
    it 'displays the current order' do
      order.take_order(an_order)
      expect(order.check_order).to include an_order
    end
  end

  describe '#take_order' do

    before do
      order.take_order(an_order)
    end

    it 'stores the last made order' do
      order.take_order(another_order)
      expect(order.check_order.last).to eq another_order
    end

    xit 'increases the cost of an order' do
      expect(order.total_cost).to be > 0
    end

  end

  describe '#total_cost' do
    it 'shows the current cost of an order' do
      order.take_order({'beef burger'=>'1.99'})
      expect(order.total_cost).to eq '1.99'
    end
  end

end