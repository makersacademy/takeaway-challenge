require 'order'

describe Order do
  let(:menu) do
    double :menu,
    menu: [{dish: 'BBQ',       price: 10},
           {dish: 'Sushi',     price: 6}]
  end

  describe "#choose_dish" do
    it "has customer choose a dish and quantities" do
      expect(subject.choose_dish('BBQ', 3))
        .to eq([{dish: 'BBQ', quantities: 3}])
    end
  end

  it "checks your orders" do
    subject.choose_dish('BBQ', 4)
    subject.choose_dish('Sushi', 4)
    expect(subject.check_orders(Menu.new))
      .to eq("You will be charged £64.")
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
