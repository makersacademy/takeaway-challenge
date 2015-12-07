require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(menu_klass: menu,send_sms_klass: sms)}
  let(:menu) {double :menu}
  let(:sms) {double :send_sms}
  let(:rand_num) {rand(1..9)}
  let(:customer) {{phone: :"+441123456789", name: :Sebastian}}


  context 'when selecting order' do
    it 'returns number of choices' do
      5.times {|enum| takeaway.select_order(enum, 1)}
      expect(takeaway.complete_order.size).to eq 5
    end

    it 'returns total of dishes' do
      5.times {|enum| takeaway.select_order(enum, 3)}
      expect(takeaway.total_of_dishes).to eq 15
    end
  end

  context 'when finalising order' do
    before do
      takeaway.select_order(:Chicken, 5)
      takeaway.select_order(:Chicken, 3)
      allow(sms).to receive(:confirmation_text).and_return(customer)
    end

    # it 'returns total price' do
    #   allow(takeaway).to receive(:list).and_return(2)
    #   expect{takeaway.total_price}.to change{takeaway.total_bill}.by(16)
    # end


    it 'sends a text message' do
      expect(takeaway.text_confirmation(customer)).to eq(customer)
    end
  end
end
