require "order"

describe Order do

  it "user can select dishes and they can be viewed in basket" do
    o = Order.new
    chips_double = double(:dish => "chips", :price => 1.00)
    c_c_m_double = double(:dish => "chicken chow mein", :price => 2.80)
    d_kb_double = double(:dish => "doner kebab", :price => 3.20)
    o.select_dish(chips_double, 2)
    o.select_dish(c_c_m_double)
    o.select_dish(d_kb_double, 4)
    expect(o.view_basket).to eq([{ dish: chips_double, quantity: 2, price: 2.00 },
      { dish: c_c_m_double, quantity: 1, price: 2.80 },
      { dish: d_kb_double, quantity: 4, price: 12.80 }])
  end

end
