require 'calculate'

describe Calculate do

  subject(:sum) { described_class.new }

  describe '#total' do
    it 'should return a total' do
      array = [[name: "Chicken", quantity: 1, price: 4.5], [name: "Chips", quantity: 1, price: 2]]
      expect(sum.total(array)).to eq 6.5
    end
  end

end
