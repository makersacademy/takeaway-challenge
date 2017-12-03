require 'text'

describe Text do

  subject(:text) { described_class.new }
  # allow(Time).to receive(:now).and_return(Time.new(2017, 10, 12, 12, 30))
  # subject(:mock_time) {double(:mock_time, (Time.new + 60 * 60).strftime("%H:%M"))}

  describe "#send_text" do
    # before do
    #   allow(subject).to receive(:send_text)
    # end

    it "sends a text message with order confirmation" do
      subject.send_text
    end

    it "sends a confirmation text message" do
      expect(subject).to receive(:send_text).and_return("Order successful. Estimated delivery time 19:00")
      subject.send_text
    end

  end

  describe "#order_summary" do
    it "should confirm the order with a delivery time" do
    expect(subject.order_summary).to eq "Thank you for your order. The estimate delivery time is #{(Time.new + 60 * 60).strftime(Text::TIME_FORMAT)}"
    end
  end

  describe "#delivery_time" do
    it "should show the delivery time an hour after the current time" do
      expect(subject.delivery_time). to eq "#{(Time.new + 60 * 60).strftime(Text::TIME_FORMAT)}"
    end
  end
end
