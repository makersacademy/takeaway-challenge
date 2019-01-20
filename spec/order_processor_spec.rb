require 'order_processor'

describe OrderProcessor do

  before(:each) do
    @fish_dish = Dishes.new("Fish", 3)
    @pasta_dish = Dishes.new("Pasta", 1)
    @list_of_dishes = ListOfDishes.new
    @list_of_dishes.add_dish(@fish_dish, @pasta_dish)
    @order_processor = OrderProcessor.new(@list_of_dishes)
    @orders = { :"1" => 2, :"2" => 3 }
  end

  it "should accept orders with number of dishes" do
    expect(@order_processor).to receive(:add_order).with(1, 2)

    @order_processor.add_order(1, 2)
  end

  it "should add order to orders and return a hash with, key as order number and value as quantity" do
    @order_processor.add_order(1, 2)
    @order_processor.add_order(2, 3)

    expect(@order_processor.orders).to eql(@orders)
  end

  it "Sum of dishes ordered should be equal to orders values" do
    @order_processor.add_order(1, 2)
    @order_processor.add_order(2, 3)

    expect(@order_processor.number_of_orders).to eql(5)
  end

  it "Sum of prices of dishes ordered should be equal to expected price" do
    @order_processor.add_order(1, 1)
    @order_processor.add_order(2, 1)

    allow(@order_processor.sms_message_sender).to receive(:send_sms_message).and_return("Message sent!")

    expect(@order_processor.overall_price).to eql(4.0)
  end

  it "should add to quantity of the same dish number" do
    @order_processor.add_order(1, 1)
    @order_processor.add_order(1, 1)

    expect(@order_processor.orders[:"1"]).to eql(2)
  end

  it "should match total order of 2 and total price of £4" do
    @order_processor.add_order(1, 1)
    @order_processor.add_order(2, 1)

    expect(@order_processor.number_of_orders).to eql(2)
    expect(@order_processor.overall_price).to eql(4.0)
  end

  it "should reset order processor and return 0" do
    @order_processor.add_order(1, 1)

    allow(@order_processor.sms_message_sender).to receive(:send_sms_message).and_return("Message sent!")

    expect(@order_processor.execute_order(1, 3.0)).to eql(0)
  end

end
