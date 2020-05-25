require 'select'

describe Select do
  let(:item) { double :item }
  let(:quantity) { double :quantity }

  context "#selection" do
    it "should respond to the method order with 2 arg" do
      expect(subject).to respond_to(:order).with(2).argument
    end

    it "should push meal items into the basket" do
      subject.order(item, quantity)
      expect(subject.basket).to eq({ item: quantity })
    end

    # it "should total the order" do
    #   subject.order(item, quantity)
    #   expect(subject.order_overview).to eq "£15"
    # end

    # it "returns the block's return value" do
    #   loan = double("Loan", :amount => 100)
  
    #   allow(loan).to receive(:required_payment_for_rate) do |rate|
    #     loan.amount * rate
    #   end
  
      # expect(loan.required_payment_for_rate(0.05)).to eq(5)
      # expect(loan.required_payment_for_rate(0.1)).to eq(10)
    # end
  end
end
