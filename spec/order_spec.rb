require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu)}
  let(:menu) { instance_double("Menu") }

  let(:printed_menu) do
    { "Water" => 3, "Tea" => 4, "Coffee" => 2 }
  end
  let(:dishes) do
    [{"item"=>"Water", "price"=>3, "quantity"=>1}, {"item"=>"Tea", "price"=>4, "quantity"=>2}]
  end


 it "can add several dishes to the order" do

  order.add("Water", 1)
  order.add("Tea", 2)
  expect(order.show_order).to eq(dishes)

  end


    it "sends a text message when order is placed" do
      send_sms_double = double :send_sms
      send_sms_class_double = double :send_sms_class, new: send_sms_double
      order = Order.new(send_sms_class_double)
      order.add("Water", 1)
      order.add("Tea", 2)
      expect(send_sms_double).to receive(:send_message)
      order.place_order

     end

    it "can place the order by giving the list of dishes, their quantities and total cost" do
      send_sms_double = double :send_sms, send_message: "test, we already know it sends a text"
      send_sms_class_double = double :send_sms_class, new: send_sms_double
      order = Order.new(send_sms_class_double)
      order.add("Water", 1)
      order.add("Tea", 2)
      expect(order.place_order).to eq "Here is your order #{dishes}, the total is 11"
    end



  it "can check the total of the order" do
    order.add("Water", 1)
    order.add("Tea", 2)
    expect(subject.total_check).to eq 11

    end
    it "sends an error message if the item doesn't exist" do
      expect{ order.add("Sweets", 1) }.to raise_error "That item doesn't exist"
  end
end
