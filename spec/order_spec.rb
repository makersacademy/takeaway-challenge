require 'order'

describe Order do

  # let(:food) { "Food test" }
  #
  # let(:item1) { ":yum1=>1" }
  # let(:item2) { ":yum2=>2" }
  #


 it "can add one dishes to the order" do

  subject.add("Water", 1)
  expect(subject.show_order).to eq([{"item"=>"Water", "price"=>3, "quantity"=>1}])

  end

  it "can add several dishes to the order" do

    subject.add("Water", 1)
    subject.add("Tea", 2)
    expect(subject.show_order).to eq([{"item"=>"Water", "price"=>3, "quantity"=>1},
       {"item"=>"Tea", "price"=>4, "quantity"=>2}])
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
      send_sms_double = double :send_sms, send_message: "test"
      send_sms_class_double = double :send_sms_class, new: send_sms_double
      order = Order.new(send_sms_class_double)
      order.add("Water", 1)
      order.add("Tea", 2)
      expect(order.place_order).to eq "Here is your order [{\"item\"=>\"Water\", \"price\"=>3, \"quantity\"=>1}, {\"item\"=>\"Tea\", \"price\"=>4, \"quantity\"=>2}], the total is 11"
    end



  it "can check the total of the order" do
    subject.add("Water", 1)
    subject.add("Tea", 2)
    expect(subject.total_check).to eq 11

    end
  end
