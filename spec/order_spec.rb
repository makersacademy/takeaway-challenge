require 'order'

RSpec.describe Order do
  subject(:order) { described_class.new }

  context 'order selection' do
    it 'stores an initial selection' do
      selection = [1,1,2,3]
      order = described_class.new(selection)
      expect(order.selection).to eq selection
    end
  end

  # context 'order confirmation' do
  #   it 'displaying the total' do
  #     selection = [1,1,2,3]
  #     order = described_class.new(selection)
  #
  #   end
  # end
end
