require 'order'

describe Order do

  order = Order.new


  it "Ensures the current order is empty to start with" do
    expect(order.current_order).to be_empty
  end

  it "Checks that the total order price is 0 to start with" do
    expect(order.total_price).to eq 0
  end

  it "Checks that fries have been added to the current_order" do
    order.add_item("fries",3)
    expect(order.current_order).to include {"fries"}
  end

  before do
    allow(order).to receive(:send_text)
  end

  it 'Sends a delivery confirmation message' do
    delivery = (Time.now + 3600).strftime("%H:%M")
    expect(order).to receive(:send_text).with("Thank you for your order; your food will be delivered by #{delivery}")
    order.send_text("Thank you for your order; your food will be delivered by #{delivery}")
  end


end
