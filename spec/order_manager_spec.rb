require "order_manager"
require "order"

describe OrderManager do

  let(:dish) { double(name: "Naan", price: 195) }
  let(:dish2) { double(name: "Rice", price: 350) }
  let(:order) { double(total_price: 1500) }
  let(:menu) { double :Menu }

  it "stores orders" do
    expect { subject.create_order(menu) }.to change { subject.orders.length }.by 1
  end

  it "adds up prices of selected dishes" do
    expect(subject.prices_sum([dish, dish2])).to eq (dish.price + dish2.price)
  end

  it "allows user to create an order" do
    allow(subject).to receive(:create_order).and_return(order)
    expect(subject.create_order(menu).total_price).to eq 1500
  end

  it "allows user to create an actual Order" do
    subject.create_order(menu)
    expect(subject.orders[-1].class).to eq Order
  end


  
end
