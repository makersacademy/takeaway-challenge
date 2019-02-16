require "order"

describe Order do

  let(:menu) { double :menu }

  it "imports a menu when initialized" do
    o = Order.new(menu)
    expect(o.view_menu).to eq(menu)
  end

  it "user can select dishes and they can be viewed in basket" do
    view_menu_double = double([{ "chips" => 1.00 },
        { "chicken chow mein" => 2.80 },
        { "doner kebab" => 3.20 }])
    o = Order.new
    allow(o).to receive(:view_menu).and_return(view_menu_double)
    o.select_dish("chips", 2)
    o.select_dish("chicken chow mein")
    o.select_dish("doner kebab", 4)
    view_basket = [{ dish: "chips", quantity: 2, price: 2.00 },
      { dish: "chicken chow mein", quantity: 1, price: 2.80 },
      { dish: "doner kebab", quantity: 4, price: 12.80 }]
    expect(o.view_basket).to eq(view_basket)
  end

  it "calculates total" do
    view_menu_double = [{ dish: "chips", quantity: 2, price: 2.00 },
      { dish: "chicken chow mein", quantity: 1, price: 2.80 },
      { dish: "doner kebab", quantity: 4, price: 12.80 }]
    o = Order.new
    allow(o).to receive(:view_basket).and_return(view_menu_double)
    expect(o.total).to eq(17.60)
  end

end
