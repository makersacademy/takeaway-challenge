require 'takeaway'

describe Takeaway do
  let(:order_class) { double "order_class" }
  let(:takeaway) { described_class.new(order_class)}

  it 'should be able to take a order and return the price' do
    allow(STDIN).to receive(:gets).and_return("1", "1", "", "yes")
    allow(order_class).to receive(:show_menu)
    allow(order_class).to receive(:dish_name).and_return("Fried Rice")
    allow(order_class).to receive(:add_to_order).and_return({ "Fried Rice" => 1 })
    allow(order_class).to receive(:item_list).and_return("1x Fried Rice £6.00\n")
    allow(order_class).to receive(:finish_order)
    allow(order_class).to receive(:total_cost).and_return(6)
    takeaway.take_order
    expect(takeaway.order.total_cost).to eq(6)
  end

  it 'should send a confirmation text when order is complete' do
    expect(takeaway).to receive(:send_text).with("message")
    takeaway.send_text("message")
  end
end
