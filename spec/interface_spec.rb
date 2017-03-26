require "interface"


describe Interface do

  subject(:interface) {described_class.new}

  it "confirm you placed an order" do
    expect(interface).to respond_to(:send_message)
    # allow(interface).to receive(:send_message) {"Message sent!"}
    expect(interface).to receive(:send_message)
    interface.place_order
  end

end
