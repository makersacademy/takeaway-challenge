require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(menu)}
  let(:menu) {double :menu}
  let(:rand_num) {rand(1..9)}

  context 'when selecting order' do
    it 'returns number of choices' do
      5.times {|enum| takeaway.select_order(enum, rand_num)}
      expect(takeaway.complete_order.size).to eq 5
    end

    it 'returns total of dishes' do
      5.times {|enum| takeaway.select_order(enum, 3)}
      expect(takeaway.total_of_dishes).to eq 15
    end
  end
end
