require 'takeaway_order'

describe TakeawayOrder do
  let(:takeaway_order)  { TakeawayOrder.new }

  context "#initialize" do
    it 'successfully instantiates the TakeawayOrder class' do
      expect(takeaway_order).to be_instance_of(TakeawayOrder)
    end
  end
end
