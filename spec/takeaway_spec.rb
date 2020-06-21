require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new }

  context "adding a dish to the menu" do
    describe "#add" do
      it "should add a dish to the menu" do
        dish = double("dish", name: "pasta", price: 12.99)

        expect { takeaway.add(dish) }.to change { takeaway.menu }.from([]).to([{ name: "pasta", price: 12.99 }])
      end
    end
  end

  context "user viewing the restaurant" do
    describe "#list" do
      it "should list the dishes in the menu" do
        dish = double("dish", name: "pasta", price: 12.99)
        takeaway.add(dish)

        expect { takeaway.list }.to output("#{dish.name} \£#{dish.price}\n").to_stdout

      end
    end
  end
end
