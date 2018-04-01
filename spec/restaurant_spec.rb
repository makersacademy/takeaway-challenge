require 'restaurant'
require 'menu'
describe Restaurant do
  subject(:takeaway) { described_class.new }
  describe 'order tests' do

    it 'has an order in basket once placed' do
      takeaway.order('curry', 1, 1)
      expect(takeaway.basket).to eq [['curry', 1]]
    end
  end
end
