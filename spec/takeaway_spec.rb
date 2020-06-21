require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new }

  context "changing the menu" do
    describe "#add" do
      it "should add a dish to the menu" do
        dish = double("dish", name: "pasta", price: 12.99)

        expect { takeaway.add(dish) }.to change { takeaway.menu }.from([]).to([{ name: dish, available: true }])
      end
    end

    describe "#available" do
      it "should change the availability of a dish" do
        dish = double("dish", name: "pasta", price: 12.99)
        takeaway.add(dish)
        expect { takeaway.available(dish) }.to change { takeaway.menu }.from([{ name: dish, available: true }]).to([{ name: dish, available: false }])
      end
    end
  end

  context "user viewing the restaurant" do
    describe "#list_available" do
      it "should list the dishes in the menu" do
        dish = double("dish", name: "pasta", price: 12.99)
        takeaway.add(dish)

        expect { takeaway.list_available }.to output("1\. #{dish.name} \£#{dish.price}\n").to_stdout
      end

      it "should only list the available dishes in the menu" do
        dish = double("dish", name: "pasta", price: 12.99)
        desert = double("dish2", name: "tiramisu", price: 12.99)
        takeaway.add(dish)
        takeaway.add(desert)
        takeaway.available(desert)

        expect { takeaway.list_available }.to output("1\. #{dish.name} \£#{dish.price}\n").to_stdout
      end
    end
  end

  context "user places an order" do
    describe "#order" do
      it "should create a new order" do
        desert = double("dish2", name: "tiramisu", price: 12.99)
        order_double = double("order double")
        order_class = double("order class", new: order_double)
        expect(order_class).to receive(:new).with(["desert"])

        takeaway.add(desert)

        allow(takeaway).to receive(:gets).and_return("desert\n")
        
        takeaway.order(order_class)
      end
      
      it "should be able to order multiple dishes" do
        dish = double("dish", name: "pasta", price: 12.99)
        desert = double("dish2", name: "tiramisu", price: 12.99)
        takeaway.add(dish)
        takeaway.add(desert)
        order_double = double("order double")
        order_class = double("order class", new: order_double)
        expect(order_class).to receive(:new).with(["desert", "dish"])

        takeaway.add(dish)
        takeaway.add(desert)

        allow(takeaway).to receive(:gets).and_return("desert, dish\n")
        takeaway.order(order_class)
      end
    end
  end
end
