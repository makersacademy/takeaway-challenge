require 'welcome'

describe Welcome do
  let (:customer) { double :customer }
  let (:customerClass) { double :Customer, new: customer}
  let (:takeaway) { double :takeaway}
  let (:takeawayClass) { double :Takeaway, new: takeaway}
  let(:menuClass) {double :Menu, new: menu}
  let(:orderClass) {double :Order, new: order}
  let(:message_handlerClass) {double :Message_Handler, new: message_handler}

  subject {Welcome.new customerClass, takeawayClass, menuClass, orderClass, message_handlerClass}

  before do
    allow(customer).to receive(:takeaway=).with(takeawayClass)
  end

  it "creates a customer"  do
    expect(customer).to be customer
  end

  xit "creates a takeaway for each customer" do
    expect(customer.takeaway).to be takeaway
  end
end