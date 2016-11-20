require './lib/order'

describe Order do

  let(:order) { described_class.new }
  let(:takeaway) { double(:takeaway) }

  before do
    allow(takeaway).to receive(:accept_order)
  end

  context 'Initialization' do

    it 'creates an empty basket on initialization' do
      expect(order.basket).to eq []
    end

  end



end
