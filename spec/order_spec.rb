describe Order do
  let(:menu) do
    double :menu,
    menu: [{dish: 'BBQ',       price: 10},
           {dish: 'Sushi',     price: 6}]
  end

  it "has customer choose a dish and quantities" do
    expect(subject.choose_dish(Menu.new, 'BBQ', 3))
      .to eq([{dish: 'BBQ', price: 10, quantities: 3}])
  end


  it "checks your orders" do
    menu = Menu.new
    subject.choose_dish(menu, 'BBQ', 4)
    subject.choose_dish(menu, 'Sushi', 4)
    expect(subject.check_orders).to eq("You will be charged £64.")
  end

  it "places orders when you pay" do
    menu = Menu.new
    subject.choose_dish(menu, 'BBQ', 4)
    subject.choose_dish(menu, 'Sushi', 4)
    subject.place_orders(64)
    expect(subject.orders.first[:paid]).to be true
    expect(subject.orders.last[:paid]).to be true
  end

#   it "executes orders" do
#     text = double :text
#     allow(Text).to receive(:send_text_message).and_return(true)
#     allow(subject).to receive(:gets).and_return('4')
#     subject.choose_dish
#     allow(subject).to receive(:gets).and_return('2')
#     subject.choose_how_many
#     subject.cart(menu)
#     expect(subject.execute_orders.first[:paid]).to be true
#   end
end
