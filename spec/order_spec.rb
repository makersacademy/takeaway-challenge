require "order"

describe Order do
  
  order = Order.new

  it "can see the list with dishes and prices" do
    expect(order.see_menu).to be_an_instance_of Hash
  end

  it "can select dishes" do
    menu = double('menu', :dishes => ["Soft Drink" ,
    "Sandwich (Cold)", "Sandwich (Hot)", "Fresh Juices", "Pastries"])
    order.see_menu
    expect(order.select_dishes(menu.dishes[3])).to eq([menu.dishes[3]])
  end

  it "can calculate the total" do
    order.see_menu
    order.select_dishes("Soft Drink")
    expect(order.total).to eq(1.50 + 4.70)
  end

  # it "can diplay the total with the selected dishes" do
  # end

  # it "can send SMS" do
  # end

end