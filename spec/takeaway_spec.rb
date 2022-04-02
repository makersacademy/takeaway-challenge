require 'takeaway'

describe Takeaway do
  let(:order_class) { double "order_class" }
  let(:text_client) { double "text_client" }
  let(:takeaway) { described_class.new(order_class, text_client)}

  it 'should be able to take a order and return the price' do
    allow(STDIN).to receive(:gets).and_return("1111111111","1", "1", "", "yes")
    allow(order_class).to receive(:show_menu)
    allow(order_class).to receive(:dish_name).and_return("Fried Rice")
    allow(order_class).to receive(:add_to_order).and_return({ "Fried Rice" => 1 })
    allow(order_class).to receive(:item_list).and_return("1x Fried Rice £6.00\n")
    allow(order_class).to receive(:finish_order)
    allow(order_class).to receive(:total_cost).and_return(6)
    allow(text_client).to receive(:send_text)
    takeaway.take_order
    expect(takeaway.order.total_cost).to eq(6)
  end

  it 'should be able to take a order, say no to confirm and add more to order' do
    allow(STDIN).to receive(:gets).and_return("1111111111","1", "1", "", "no", "2", "2", "", "yes")
    allow(order_class).to receive(:show_menu)
    allow(order_class).to receive(:dish_name).and_return("Fried Rice")
    allow(order_class).to receive(:add_to_order).and_return({ "Fried Rice" => 1, "Chow Mein" => 2 })
    allow(order_class).to receive(:item_list).and_return("1x Fried Rice £6.00\n2x Chow Mein £12.20\n")
    allow(order_class).to receive(:finish_order)
    allow(order_class).to receive(:total_cost).and_return(18.2)
    allow(text_client).to receive(:send_text)
    takeaway.take_order
    expect(takeaway.order.total_cost).to eq(18.2)
  end
end
