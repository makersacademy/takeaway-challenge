require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:rand_num) { rand(1..9) }

  context 'when selecting an order' do
    it 'returns the number of choices' do
      5.times {|enum| takeaway.select_order(enum, rand_num)}
      expect(takeaway.order.size).to eq 5
    end

    it 'returns the number of dishes' do
      5.times {|enum| takeaway.select_order(enum, 4)}
      expect(takeaway.total_of_dishes).to eq 20
    end
  end

  context 'when finalising an order' do
    it 'returns the total' do
      takeaway.select_order(:Lamb_curry, 2)
      takeaway.select_order(:Chicken_curry, 4)
      expect(takeaway.total_price).to eq 26
    end
  end
end
