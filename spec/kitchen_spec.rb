require 'takeaway'

describe Kitchen do

  it "should exist" do
    expect(subject).to be_instance_of(Kitchen)
  end

  it "should receive orders from the Takeaway" do
    takeaway = Takeaway.new
    takeaway.create_order("name")
    takeaway.test_method(1)
    takeaway.submit_order
    expect(takeaway.kitchen.cooking.length).to eq(1)
  end

  it "sends a message when an order is received" do
    expect { subject.send_message.process("Message to customer") }.to output.to_stdout 
  end

end
