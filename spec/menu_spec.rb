require "menu"

describe Menu do

  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }
  subject(:menu) { described_class.new(:pepperoni, :hawaiian, :meat_feast) }

  describe "#initialize" do


  end

  describe "#dishes" do
    it "returns the dish objects passed at initialization" do
      expect(menu.dishes).to include(:pepperoni, :hawaiian, :meat_feast)
    end
  end

end
