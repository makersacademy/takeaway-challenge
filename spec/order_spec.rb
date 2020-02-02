require 'order'

describe Order do
  let(:menu) { Menu.new({ pizza: 4, burger: 3, hot_dog: 2 }) }
  let(:subject) { Order.new(menu) }

  describe "#add" do
    it 'adds dishes to the basket' do
      subject.add("pizza", 2)
      expect(subject.basket.dishes).to eq ["pizza", "pizza"]
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

  describe "#total" do
    it 'tells the total amount' do
      subject.add("pizza", 2)
      subject.add("burger", 1)
      expect(subject.total).to eq 11
    end
  end

  describe "#summary" do
    it 'summarizes the basket contents' do
      subject.add(:burger, 2)
      subject.add(:pizza, 3)
      expect(subject.summary).to eq "Burger x 2: £6\nPizza x 3: £12\nTotal: £18\n"
    end
  end

  describe "#pay" do
    before(:each) { subject.add("pizza", 2) }
    it 'responds to the pay method' do
      expect(subject).to respond_to(:pay)
    end

    it 'raises an error if payment amount not correct' do
      expect { subject.pay(9) }.to raise_error { "Payment amount incorrect" }
    end

    it 'raises no error if payment amount correct' do
      expect { subject.pay(8) }.not_to raise_error
      expect(subject.pay(8)).to eq "Payment of £8 successful."
    end
  end 
end
