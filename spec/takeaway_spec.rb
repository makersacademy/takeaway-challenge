require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new({menu_klass: menu,
                                          sendSms_klass: sender})}
  let(:menu) {double :menu}
  let(:sender) {double :sendSms}
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

  context 'when finalising order' do
    xit 'returns total price' do
      takeaway.select_order(:Chicken, 5)
      takeaway.select_order(:Chicken, 3)
      allow(takeaway).to receive(:list).and_return (2)
      expect{takeaway.total_price}.to change {takeaway.total_bill}.by(16)
    end
  end
end
