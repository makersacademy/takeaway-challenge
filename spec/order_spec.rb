require './docs/order.rb'

describe Order do
  subject(:order) { described_class.new }

  describe 'new dish list' do
    it 'should create an empty array when initialized' do
      expect(order.view).to be_an(Array)
    end
  end
end
