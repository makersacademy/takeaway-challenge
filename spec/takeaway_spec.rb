require 'takeaway'

describe Takeaway do
  let(:dish1) { double("Dish1", :name => "Burger", :price => 5) }
  let(:dish2) { double("Dish2", :name => "Chips", :price => 6) }
  let(:dish3) { double("Dish3", :name => "Chicken", :price => 7) }
  let(:order) { double("Order", :id => 123, :total => 10) }
  let(:order_class) { double("OrderClass", :new => order) }
  let(:takeaway) { Takeaway.new([dish1, dish2, dish3], order_class: order_class) }


  it "stores a list of dishes" do
    expect(takeaway.dishes).to eq([dish1, dish2, dish3])
  end

  it "shows a list of dishes with the price" do
    output = "Dish: #{dish1.name}\nPrice: £#{dish1.price}\n\n"\
             "Dish: #{dish2.name}\nPrice: £#{dish2.price}\n\n"\
             "Dish: #{dish3.name}\nPrice: £#{dish3.price}\n"
    
    expect { takeaway.menu }.to output(output).to_stdout
  end

  it "lets you select dishes and add them to an order" do
    takeaway.select(dish1)
    allow(order_class).to receive(:new).with(dish1)

    expect(takeaway.current_order).to eq(order_class.new([dish1]))
  end

  it "can add multple dishes" do
    takeaway.select(dish1)
    allow(order).to receive(:add).with(dish2)
    takeaway.select(dish2)
    allow(order).to receive(:basket).and_return([dish1, dish2])
    expect(takeaway.current_order.basket).to eq([dish1, dish2])
  end

  it "confirms order with a text" do
    one_hour_from_now = (Time.now + 3600).strftime("%H:%M")
    allow(order).to receive(:delivery_time).and_return(one_hour_from_now)

    takeaway.select(dish1) # new mock order is created inside the takeaway instance

    expect(takeaway.sms_client).to receive(:text)
    .with("Thank you! Your order ##{order.id} totalling £#{order.total} has been placed "\
          "and will be delivered by #{one_hour_from_now}.")
    takeaway.confirm_order
  end
end