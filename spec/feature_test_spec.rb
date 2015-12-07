require 'takeaway'
require 'sms_notificaiton'

describe 'Feature_test' do
  let(:takeaway) {Takeaway.new}
  let(:sms) {SmsNotification.new}
  let(:menu) {Menu.new}
  before do
    takeaway.cuisine(:pizza)
    allow(takeaway).to receive(:sms_notificaiton)
  end
  describe 'Takeaway' do
  describe '#menu' do
    it 'displays a list of dishes and prices' do
      expect(takeaway.food).to include(margareta: 4)
    end
  end
  describe '#select_dish' do
    it 'can select a number of dishes and stores them in a current_order' do
      takeaway.select_dish(:margareta, 1)
      takeaway.select_dish(:hawaiian, 2)
      expect(takeaway.current_order).to include(margareta: 1, hawaiian: 2)
    end
    context 'when an invalid dish is inputted' do
      it 'can reject invaild dishes' do
        expect{takeaway.select_dish(:invalid, 5)}.to raise_error('Sorry this is an invalid dish if you havent, please load a cuisine')
      end
    end
  end
  describe '#order_total' do
    it 'provides an order total adding to the amount of dishes and there price' do
      takeaway.select_dish(:margareta, 1)
      takeaway.select_dish(:hawaiian, 2)
      expect(takeaway.order_total).to eq(14)
    end
  end
  describe '#confirm order' do
    it 'can confirm an order' do
      expect(takeaway).to respond_to(:confirm_order)
    end
  end
  end

  describe 'sms_notification' do
    it 'responds to order method' do
      expect(sms).to respond_to(:order)
    end
  end

  describe 'menu' do
    it 'allows users to select a cuisine' do
      menu.pizza
      expect(menu.food).to eq({margareta: 4, hawaiian: 5})
    end
  end

end
