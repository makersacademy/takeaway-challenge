require "order"

describe Order do

  let(:menu) { double :menu }

  let(:total_checker) { double :total_checker }

  let(:menu_double) do
    [{ "chips" => 1.00 },
      { "chicken chow mein" => 2.80 },
      { "doner kebab" => 3.20 }]
  end

  before(:each) do
    @order = Order.new
    allow(@order).to receive(:view_menu).and_return(menu_double)
    @order.select_dish("chips", 2)
    @order.select_dish("chicken chow mein")
    @order.select_dish("doner kebab", 4)
  end

  it "imports a menu when initialized" do
    @order_init = Order.new(menu)
    expect(@order_init.view_menu).to eq(menu)
  end

  it "user can select dishes and they can be viewed in basket" do
    expect(@order.view_basket).to eq([{ dish: "chips", quantity: 2, price: 2.00 },
      { dish: "chicken chow mein", quantity: 1, price: 2.80 },
      { dish: "doner kebab", quantity: 4, price: 12.80 }])
  end

  it "calculates total" do
    expect(@order.total).to eq(17.60)
  end

  it "can place an order" do
    sms_double = double(:sms)
    allow(sms_double).to receive(:send).and_return("message sent")
    allow(@order).to receive(:total_checker).and_return true
    expect(@order.place_order(17.60, sms_double)).to eq "message sent"
  end

end
