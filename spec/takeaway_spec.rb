require 'takeaway'

describe Takeaway do
  let(:dish1) { double("Dish1", :name => "Burger", :price => 5) }
  let(:dish2) { double("Dish2", :name => "Chips", :price => 6) }
  let(:dish3) { double("Dish3", :name => "Chicken", :price => 7) }
  let(:takeaway) { Takeaway.new([dish1, dish2, dish3])}

  it "stores a list of dishes" do
    expect(takeaway.dishes).to eq([dish1, dish2, dish3])
  end

  it "shows the price of each dish" do
    output = "Dish: #{dish1.name}\nPrice: £#{dish1.price}\n\n"\
             "Dish: #{dish2.name}\nPrice: £#{dish2.price}\n\n"\
             "Dish: #{dish3.name}\nPrice: £#{dish3.price}\n"
    
    expect { takeaway.menu }.to output(output).to_stdout
  end

  it "lets you select dishes and add them to an order" do
    takeaway.order(dish1)
    expect(takeaway.current_order.basket).to eq([dish1])
  end

  it "can add multple dishes" do
    takeaway.order(dish1)
    takeaway.order(dish2)
    expect(takeaway.current_order.basket).to eq([dish1, dish2])
  end

  it "confirms orders with a text" do
    one_hour_from_now = (Time.now + 3600).strftime("%H:%M")
    takeaway.order(dish2)

    expect(takeaway).to receive(:text)
    .with("Thank you! Your order has been placed and will be delivered by #{one_hour_from_now}.")
    takeaway.confirm
  end
end