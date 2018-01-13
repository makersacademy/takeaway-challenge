require 'cafe'

describe Cafe do

  subject(:cafe) { described_class.new }
  # let(:menu) { double :menu }

  describe 'menu retrieval' do
    it 'requests menu' do
      expect(cafe.read_menu).to eq "What would you like to order?"
    end
  end

  describe 'order' do
    it 'confirms order' do
      expect(cafe.order_me("CHIA_PUDDING")).to eq "You have ordered CHIA_PUDDING"
    end
  end

end

# describe 'ordering' do
#   it 'receives order' do
#     my_order = "BANANA BREAD"
#     expect(cafe.receive_order(my_order)).to eq "BANANA BREAD"
#   end
# end
