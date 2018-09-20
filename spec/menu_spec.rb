require 'menu'

describe Menu do
  describe "#show" do
    it "should have a show method" do
      expect(subject).to respond_to(:show)
    end
    it "should show a list of dishes with price" do
      expect(subject.show).to eq [{"Lasagna"=>10}, {"Pasta"=>5}]
    end
  end

  describe "#add" do
    it { is_expected.to respond_to(:add).with(1).argument }

    it "should add a dish to the menu" do
      dish = Dish.new("Lasagna", 10)
      subject.add(dish)
      expect(subject.show).to eq([{"Lasagna"=>10}, {"Pasta"=>5}, { "Lasagna" => 10 }])
    end
  end
end
