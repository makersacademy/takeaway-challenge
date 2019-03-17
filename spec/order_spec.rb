require 'order'

describe Order do
  let(:text_message) { double :message }
  let(:order) { Order.new(Menu.new, text_message) }
  let(:this_order) { double :order_list }

  it "receives a new order and returns a success message" do
    total_cost = 9
    allow(this_order).to receive(:calculate_cost) { total_cost }
    allow(text_message).to receive(:send_text) # needs amending to be twilio response
    expect(order.place(this_order, total_cost)).to eq "order placed"
  end

  it "receives a new order and returns a failure message" do
    total_cost = 9
    allow(this_order).to receive(:calculate_cost) { total_cost - 1 }
    allow(text_message).to receive(:send_text)
    expect { order.place(this_order, total_cost) }.to raise_error "order cost does not match expected cost"
  end

  it "receives a new order and calls the send_text method" do
    total_cost = 9
    allow(this_order).to receive(:calculate_cost) { total_cost }
    expect(text_message).to receive(:send_text) # needs amending to be twilio response
    order.place(this_order, total_cost)
  end
end
