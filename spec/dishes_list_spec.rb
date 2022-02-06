require "dishes_list"

describe DishesList do

  let(:dish) { double }
  let(:disha) { double :dish, :available? => true }
      
  describe "when initializing" do

    it "expects an empty dishes array" do
      expect(subject.dishes).to eq([])
    end

    it "will add a single dish to the menu" do
      subject.add_item(dish)
      expect(subject.dishes).to eq([dish])
    end

    it "will load the menu with an entire list of dishes" do
      subject.load_menu
      expect(subject.dishes.size).to be(9)
    end

  end

end
