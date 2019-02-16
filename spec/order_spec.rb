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

  # it "total checker returns true if total_checker return true" do
  #   expect(@order.total_checker(total_checker)).to eq true
  # end

  it "can place an order" do
    expect(@order.place_order).to eq true
  end

end
