require "checkout"

shared_context "common checkout" do
  let(:messsage_klass) {double("message", send: "send")}
  subject {described_class.new(messsage_klass)}
  #dummy basket
  let(:dish_two_basket) {{dish: "chips", price: 0.5, ordered: 5}}
  let(:dish_three_basket) {{dish: "ramen", price: 0.9, ordered: 10}}
  let(:basket) {[dish_two_basket, dish_three_basket]}
end

describe Checkout do
  include_context "common checkout"

  context "initialized instance variable" do
    it "message" do
      expect(subject.instance_variable_get(:@message)).to eq(messsage_klass) 
    end
  end

  context "responds to" do
    it "#order_confirmation" do
      expect(subject).to respond_to(:order_confirmation)
    end
  end

  context "method functionality" do
    it "#checkout prints current order for confirmation" do
      expect{subject.order_confirmation(basket)}.to output("Here is your order: \n\nx5 chips      £2.5\nx10 ramen      £9.0\ntotal:      £11.5\n").to_stdout
    end
     it "#order_confirmation delegates to Message.send" do
      expect(messsage_klass).to receive(:send).once
      subject.order_confirmation(basket)
    end
  end
end