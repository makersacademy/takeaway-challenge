require "dishes_list"

describe DishesList do

  let(:dish) { double }
  let(:disha) { double :dish, :available? => true }
      
  describe "when initializing" do

    it "expects an empty dishes array" do
      expect(subject.dishes).to eq([])
    end

    it "will add a single dish to the menu" do
      subject.add_dish(dish)
      expect(subject.dishes).to eq([dish])
    end

    it "will load the menu with an entire list of dishes" do
      subject.load_menu
      expect(subject.dishes.size).to be(9)
    end

  end

  describe "menu loaded with all dishes" do

    it "will successfully return an array of all the available dishes" do
      allow(dish).to receive(:available?).and_return(true)
      accumulation_array = []
      9.times do
        subject.add_dish(dish)
        accumulation_array << dish
      end
      expect(subject.dishes_available).to eq(accumulation_array)
    end

    it "will only show the dishes that are available" do
      allow(dish).to receive(:available?).and_return(true)
      allow(disha).to receive(:available?).and_return(false)
      subject.add_dish(dish)
      subject.add_dish(disha)
      expect(subject.dishes_available).to eq([dish])
    end

    it "will successfully show the dishes by their identifier " do
      subject.load_menu
      expect(subject.return_dish(4)).to eq(subject.dishes[3])
    end

    it "will successfully return the dishes as listed on the input file" do
      allow(dish).to receive(:available?).and_return(true)
      allow(dish).to receive(:details).and_return("1. Pizza - £10.00")
      subject.add_dish(dish)
      expect(subject.display_dishes).to eq("1. Pizza - £10.00\n")
    end
    
  end

end
