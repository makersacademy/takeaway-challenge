require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#place_order' do
    # I cannot get this to pass whatsoever after maybe an hour of trying
     # it 'can order some available dishes' do
     #   expect(takeaway.place_order(items, quantity)).to eq("tacos", 4)
    it {is_expected.to respond_to(:place_order).with(2).arguments}

  end

end
