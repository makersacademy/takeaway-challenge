require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:rand_number) {rand(20..50)}
  let(:sms_notification) {double(:sms_notification)}

  describe '#menu' do
  it 'responds to menu' do
    expect(takeaway).to respond_to(:menu)
  end
  it 'displays a list of dishes and prices' do
    expect(takeaway.food).to include(margareta: 4)
  end
  end
  describe '#select_dish' do
    it 'can select a number of dishes and stores them in a current_order' do
      takeaway.select_dish(:margareta, 8)
      takeaway.select_dish(:hawaiian, 6)
      expect(takeaway.current_order).to include(margareta: 8, hawaiian: 6)
    end
    context 'when an invalid dish is inputted' do
      it 'can reject invaild dishes' do
        expect{takeaway.select_dish(:invalid, rand_number)}.to raise_error('Sorry this is an invalid dish if you havent, please load a cuisine')
      end
    end
  end
  describe '#confirm order' do
    it 'confirming the order will send text with order and delivery details' do
    expect(takeaway).to respond_to(:confirm_order)
    end
  end

end
