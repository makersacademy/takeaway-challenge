require './docs/menu.rb'

describe Menu do

  subject(:menu) { described_class.new }

  context "Provided a menu" do

    describe "#generate_list" do
      it "generates a list full of dishes" do
        expect(menu.generate_list).not_to be_empty
      end
    end

    describe "#compose_message" do
      it "composes a string out of a list of items with name & price" do
        moke_dish = double(:dish, name: "fabada", price: 3)
        list = [moke_dish]
        expect(menu.compose_message(list)).not_to be_empty
      end
    end

  end

end
