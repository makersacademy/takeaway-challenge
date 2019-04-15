require 'order'

describe Order do
  let(:sms_double) { double(:send_sms, send: true) }
  let(:dishes_double) { double(:dishes, price_list: { "fish" => 5, "chips" => 2, "curry-sauce" => 1 }) }
  let(:subject) { described_class.new(dishes_double, sms_double) }

  
  describe '#initialize' do
    it 'accepts and assigns Dishes' do
      expect(subject.dishes).to eq dishes_double
    end
    it 'accepts and assigns SendSMS' do
      expect(subject.sms).to eq sms_double
    end
  end
  
  describe '#create' do
    it 'accepts dish selections' do
      dish_order = "chips*2,curry-sauce*3"
      subject.create(dish_order)
      expect(subject.selection).to eq dish_order
    end
  end
  
  context 'total provided equals calculated total' do
    describe '#verify' do
      it 'outputs verification message' do
        subject = described_class.new(dishes_double, sms_double)
        subject.create("chips*2,curry-sauce*3")
        user_total = 7
        msg = "Order placed and sms message sent to confirm delivery"
        expect(subject.verify(user_total)).to eq msg
      end
    end
  end
  
  context 'total provided does not equal calculated total' do
    describe '#verify' do
      it 'raises error' do
        subject = described_class.new(dishes_double, sms_double)
        subject.create("chips*2,curry-sauce*3")
        user_total = 8
        msg = "Order Error - Total does not match to price list"
        expect { subject.verify(user_total) }.to raise_error msg
      end
    end
  end
end
