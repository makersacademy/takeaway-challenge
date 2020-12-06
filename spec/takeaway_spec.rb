require 'takeaway'

describe Takeaway do
  subject { Takeaway.new }
  let(:dishes) { double(:print_menu) }

  it 'initializes with the default menu unless chosen otherwise' do
    dishes = { burgers: 3.0, falafel: 4.5, burrito: 6.5, lasagna: 7.0, quiches: 5.5 }
    expect(described_class).to receive(:new).and_return(dishes)
    Takeaway.new
  end

  describe "#read_menu" do
    it 'prints out the list of dishes' do
      expect(subject).to respond_to(:read_menu)
    end
  end

  describe "#order" do
    it 'adds to the basket if a chosen dish is available' do
      expect { subject.order("burgers", 1) }.to change { subject.basket }.to([{ burgers: 3.0 }])
    end

    it 'raises an error if there is no matching dish' do
      expect { subject.order("random_dish", 1) }.to(raise_error { "Hmm..No such dish" })
    end

    it 'adds the chosen number of dishes to the bakset' do
      expect { subject.order("burgers", 2) }.to change { subject.basket.count }.by(2)
    end
  end

  describe "#total" do
    it 'calculates the total price of items in the basket' do
      subject.order("burgers", 2)
      subject.order("falafel", 3)
      expect(subject.total).to eq 19.5
    end
  end

  describe "#basket_summary" do
    it 'shows the sum for each grouped item' do
      subject.order("burgers", 2)
      subject.order("falafel", 3)
      expect(subject.basket_summary).to eq({ burgers: 6.0, falafel: 13.5 })
    end
  end

  describe "#checkout" do

    it 'checks what the total matches the actual sum' do
      subject.order("burgers", 2)
      subject.order("falafel", 3)
      expect { subject.checkout(20) }.to raise_error
    end

    it 'places order if the total matches the actual sum' do
      allow(subject).to receive(:send_sms)
      subject.order("burgers", 2)
      subject.order("falafel", 3)
      expect { subject.checkout(19.5) }.not_to(raise_error { "the total provided does not match the basket" })
    end

    it 'sends an sms message when the order is placed' do
      subject.order("burgers", 2)
      subject.order("falafel", 3)
      expect(subject).to receive(:send_sms)
      subject.checkout(19.5)
    end

    it 'loads the send_sms file' do
      subject.order("burgers", 2)
      subject.order("falafel", 3)
      expect(subject).to receive(:send_sms)
      subject.checkout(19.5)
    end
  end
end
