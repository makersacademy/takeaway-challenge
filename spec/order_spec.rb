require "order"

describe Order do

  let(:menu) { double :menu }

  it "imports a menu when initialized" do
    o = Order.new(menu)
    expect(o.menu).to eq(menu)
  end

  it "user can select dishes and they can be viewed in basket" do
    menu_double = double [{ "chips" => 1.00 },
      { "chicken chow mein" => 2.80 },
      { "doner kebab" => 3.20 }]
    o = Order.new(menu_double)
    o.select_dish("chips", 2)
    o.select_dish("chicken chow mein")
    o.select_dish("doner kebab", 4)
    expect(o.view_basket).to eq([{ dish: chips_double, quantity: 2, price: 2.00 },
      { dish: c_c_m_double, quantity: 1, price: 2.80 },
      { dish: d_kb_double, quantity: 4, price: 12.80 }])
  end

end
