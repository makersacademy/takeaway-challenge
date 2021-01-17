require 'basket'
describe Basket do

  describe "#contents" do

    it "will be empty upon initialization" do
      expect(subject.contents).to be_empty
    end
  end

  describe "#add_dish" do
    let(:dish) { "Korma" }

    it "will add the dish to the basket contents" do
      subject.add_dish(dish)
      expect(subject.contents).to include(dish)
    end

    it "will add the quantity of dishes to the basket" do
      subject.add_dish(dish, 2)
      expect(subject.contents).to match_array([dish, dish])
    end
  end

  describe "#total" do

    it 'will return 0 if nothing is in the basket' do
      expect(subject.total).to eq 0
    end
  end
end
