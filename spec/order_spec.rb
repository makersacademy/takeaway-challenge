require 'order'


describe Order do

  let(:sms_klass) { double "SendSMS", new: nil} #SendSMS.new => sms
  subject(:order) {described_class.new(menu_class, sms_klass)}


  let(:menu_class) { double "Menu", list: menu} #Menu.list => menu
  let(:menu) do {pizza: 10, burger: 5, coke: 1} end


  context 'correct payment' do
    before do
      order.add_to_basket("pizza")
    end
    it 'calculates a total' do
      expect(order.calculate_total).to eq 10
    end
    it 'calculates a delivery time an hour from now' do
      an_hour_from_now = (Time.new + 3600).strftime("%H:%M")
      expect(order.delivery_time).to eq an_hour_from_now
    end
    it 'sends a message if order is successful' do
      message = "Thank you! Your order will be delivered before #{(Time.new + 60*60).asctime[11,5]}"
      expect(sms_klass).to receive(:new).with message
      order.send_message
    end
  end

  context 'incorrect payment' do
    before do
      order.add_to_basket("pizza")
    end
    it 'raises an error if the payment does not match the cost' do
      expect{order.check_payment(9)}.to raise_error("Incorrect payment amount")
    end
  end




end
