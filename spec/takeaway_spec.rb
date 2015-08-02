require 'takeaway'

describe Takeaway do

  subject{Takeaway.new(sms_sender)}
  let(:sms_sender) { double(:sms_sender) }

  it "responds to #menu"do
    expect(subject).to respond_to(:menu)
  end

  describe "#read_menu" do

    it "should have contents" do
      expect(subject.menu.empty?).to be false
    end

  end

  it "should respond to #place_order" do
    expect(subject).to respond_to(:place_order).with(3).arguments
  end

  describe "#place order" do

    before(:each) do
      @order_list = { "Grilled banana" => 2 }
    end

    it "should raise error if item not on menu" do
      bad_order_list = { "Koala Pie" => 4 }
      expect { subject.place_order(bad_order_list, "£20", :phonenumber) }.to raise_error "Koala Pie not on menu."
    end

    it "should raise_error if expected order total is incorrect" do
      expect { subject.place_order(@order_list, 6, :phonenumber) }.to raise_error "Expected total incorrect."
    end

    it "should call confirm_order" do
      expect(subject).to receive(:confirm_order).with(:phonenumber)
      subject.place_order(@order_list, 6.4, :phonenumber)
    end

    it "should instruct sms_sender to send a confirmation text" do
      expect(sms_sender).to receive(:send_confirmation_sms).with(:phonenumber)
      subject.place_order(@order_list, 6.4, :phonenumber)
    end

  end

end