require 'order'

describe Order do
  let(:menu) { Menu.new({ pizza: 4, burger: 3, hot_dog: 2 }) }
  let(:subject) { Order.new(menu, '123', '456', '+44777', '+44778') }
  
  context "tracking current order" do
    before(:each) do
      subject.add("pizza", 2)
      subject.add("burger", 3)
    end

    describe "#add" do
      it 'adds dishes to the basket' do
        expect(subject.basket.dishes).to eq ["pizza", "pizza", "burger", "burger", "burger"]
      end
    end

    describe "#total" do
      it 'tells the total amount' do
        expect(subject.total).to eq 17
      end 
    end

    describe "#summary" do
      it 'summarizes the basket contents' do
        expect(subject.summary).to eq "Pizza x 2: £8\nBurger x 3: £9\nTotal: £17\n"
      end
    end
  end

  describe "#remove" do
    it 'removes dishes from the basket' do
      subject.add("pizza", 2)
      subject.add("burger", 1)
      subject.remove("pizza", 4)
      expect(subject.basket.dishes).to eq ["burger"]
    end
  end

  describe "#pay" do
    before(:each) { subject.add("pizza", 2) }

    it 'responds to the pay method' do
      expect(subject).to respond_to(:pay)
    end

    it 'raises an error if payment amount not correct' do
      expect { subject.pay(9) }.to raise_error("Payment amount incorrect")
    end

    it 'sends an sms to confirm payment' do
      allow(subject.sms).to receive(:send)
      expect(subject.sms).to receive(:send)
      subject.pay(8)
    end
  end 
end
