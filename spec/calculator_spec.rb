require 'calculator'

describe Calculator do
  let(:dish_1) { double(:dish, :price => 10) }
  let(:dish_2) { double(:dish, :price => 12) }
  let(:order) { double(:order, :view => [dish_1, dish_2]) }

  subject { described_class.new(order) }

  describe '#total' do
    it 'adds up the total cost' do
      expect(subject.total).to eq 22
    end
  end
end
