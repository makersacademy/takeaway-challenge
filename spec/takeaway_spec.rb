require 'takeaway'

describe Takeaway do
  let(:dish1) { double("Dish1", :name => "Burger", :price => 6) }
  let(:dish2) { double("Dish2", :name => "Chips", :price => 2) }
  let(:dish3) { double("Dish3", :name => "Chicken", :price => 5) }
  let(:order) { double("Order", :id => 123, :total => 10) }
  let(:order_class) { double("OrderClass", :new => order) }
  let(:takeaway) { described_class.new([dish1, dish2, dish3], order_class: order_class) }
  one_hour_from_now = (Time.now + 3600).strftime("%H:%M")

  it "stores a list of dishes" do
    expect(takeaway.dishes).to eq([dish1, dish2, dish3])
  end

  it "shows a list of dishes with the price" do
    output = "Dish: #{dish1.name}\nPrice: £#{dish1.price}\n\n"\
             "Dish: #{dish2.name}\nPrice: £#{dish2.price}\n\n"\
             "Dish: #{dish3.name}\nPrice: £#{dish3.price}\n"
    
    expect { takeaway.menu }.to output(output).to_stdout
  end

  context 'choosing items:' do
    before { add_1_order(dish1) }

    it "lets you select a dish and create an order" do
      # expect(order).to receive(:add).with(dish) 
      # takeaway.select_dish(dish) - tested with before block
    end

    it "lets you add another dish" do
      expect(order).to receive(:add).with(dish2)
      takeaway.select_dish(dish2)
    end
  
    it "lets you add multiple of the same dish" do
      expect(order).to receive(:add).with(dish1).exactly(3).times
      takeaway.select_dish(dish1, 3)
    end

    it "lets you remove dishes from the order" do
      expect(order).to receive(:remove).with(dish1)
      takeaway.remove_dish(dish1)
    end

    it "lets you reset your current order" do
      expect(order).to receive(:clear_basket)
      takeaway.reset_order
    end
  end

  context 'sending texts:' do
    it "confirms order with a text" do
      add_1_order(dish1)
      allow(order).to receive(:delivery_time).and_return(one_hour_from_now)
      expect(takeaway.sms_client).to receive(:text)
      .with("Thank you! Your order ##{order.id} totalling £#{order.total} has been placed "\
        "and will be delivered by #{one_hour_from_now}.")
      takeaway.confirm_order
    end
  end

  context 'edge cases:' do
    it "can't confirm a non existent order" do
      expect { takeaway.confirm_order }.to raise_error("Please make an order first")
    end

    it "doesn't let you select a dish not in the menu" do
      other_dish = double("Other Dish")
      expect { takeaway.select_dish(other_dish) }.to raise_error("Please select a dish from this takeaway.")
    end
  end
end

def add_1_order(dish)
  # expect(order_class).to receive(:new) - implicitly tested
  expect(order).to receive(:add).with(dish) # Dish class handles the actual adding and removing
  takeaway.select_dish(dish)
end
