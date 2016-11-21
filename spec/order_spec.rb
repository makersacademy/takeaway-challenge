require './lib/order'

describe Order do

  let(:order) { described_class.new }
  let(:takeaway) { double(:takeaway) }

  context 'Initialization' do

    it 'creates an empty basket on creation' do
      expect(order.basket).to eq []
    end

  end

  context 'Calculate Total' do

    it 'calculates total cost' do
      order.basket = [{:item=>"Pizza", :qty=>3, :price=>4}]
      expect(order.calculate_total).to eq 12
    end

  end

end
