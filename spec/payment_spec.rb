require "payment"
describe Payment do

 let(:payment) { Payment.new }
  # instance of Payment class responds to execute method
  it "respond to method called execute" do
    expect(payment).to respond_to(:execute)
  end

  before do
    allow(payment).to receive(:execute)
  end
  # calling execute method on instance of payment class sends a text
  it "sends a text when execute method called" do
    expect(payment).to receive(:execute)
    payment.confirm
  end


end
