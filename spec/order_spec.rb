require "order"

describe Order do
  subject { Order.new(dish) }

  to = "+441234567890"
  let(:dish) { double :dish }
  let(:sms) { double :sms }
  let(:message_class) { double :message_class, new: sms }
  let(:time) { double :time }

  before do
    allow(dish).to receive(:price).and_return(10)
  end

  it "is not confirmed when initially created" do
    expect(subject).to_not be_confirmed
  end

  it { is_expected.to respond_to(:view_selected) }

  context "when viewing an individual order" do
    it "displays selected dishes" do
      expect(subject.view_selected).to include(dish)
    end

    it "updates selected dishes with new dish" do
      subject.update(dish, 2)
      expect(subject.view_selected).to include(dish, dish)
    end

    it "displays total price" do
      subject.update(dish, 1)
      expect(subject.view_total).to eq 20
    end
  end

  context "when finalising order" do
    it { is_expected.to respond_to(:confirm_order) }
    it { is_expected.to respond_to(:calculate_time) }

    it "sets order to confirmed" do
      subject.confirm_order(to, message_class)
      expect(subject).to be_confirmed
    end

    it "responds to sms send method" do
      expect(sms).to respond_to(:send)
    end

    before do
      allow(sms).to receive(:send)
    end

    it "sends a confirmation message" do 
      message = "Thank you! Your order was placed and will be delivered before 18:30"
      expect(sms).to receive(:send).with(message)
      subject.confirm_order(to, message_class, "18:30")
    end
  end
end
