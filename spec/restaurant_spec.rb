require "restaurant"

describe Restaurant do

  it "creates a default menu when initialized" do
    expect(subject.menu).to eq({ "starter" => 3, "main" => 6, "drinks" => 2 })
  end

  describe ".take_order" do
    it "responds to take_order with 2 arguments" do
      expect(subject).to respond_to(:take_order).with(2).argument
    end
  end

  describe ".confirm_order" do
    it "responds to confirm_order with 1 argument" do
      expect(subject).to respond_to(:confirm_order).with(1).argument
    end

    it "raises an error if total does not match sum of dish prices" do
      subject.take_order "starter", 1
      expect { subject.confirm_order nil }.to raise_error "Total does not match sum of dish prices"
    end

    it "calls send_order_confirmation if total matches sum of dish prices" do
      subject.take_order "starter", 1
      expect(subject).to receive(:send_order_confirmation)
      subject.confirm_order 3
    end
  end

  describe ".total_correct?" do
    it "responds to total_correct? with 1 argument" do
      expect(subject).to respond_to(:total_correct?).with(1).argument
    end

    it "returns true if total matches sum of dish prices" do
      subject.take_order "starter", 1
      expect(subject.total_correct? 3).to be true
    end
  end

  describe ".total_calc" do
    it "responds to total_calc" do
      expect(subject).to respond_to :total_calc
    end

    it "calculates the sum of dish prices on menu" do
      subject.take_order "starter", 1
      expect(subject.total_calc).to eq 3
    end
  end

  describe ".send_order_confirmation" do
    it "responds to send_order_confirmation" do
      expect(subject).to respond_to :send_order_confirmation
    end

    # it "sends the correct text message" do
    #   client = double :client
    #   allow(subject).to receive(:client) { client }
    #   allow(client).to receive(:account)
    #   allow(client.account).to receive(:messages)
    #   expect(client.account.messages).to receive(:create).with({:from => '+441143599202', :to => '+447903226001', :body => "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}"})
    #   subject.send_order_confirmation
    #   # expect(subject.send_order_confirmation).to
    # end
  end

end
