require 'order'

describe Order do
selection = [{dish: "Taste Test", price: 7.50}, {dish: "Test Two", price: 6.10}, {dish: "Yummr Test", price: 3.00}]
let(:subject) { described_class.new(selection) }

  describe '#total_cost' do
    it 'calculates the total cost of dish selection' do
      expect(subject.total_cost).to eq 16.60
    end
  end
end