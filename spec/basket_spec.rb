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
    let(:menu) { double(:menu, :dishes => { Korma: 5.00, Naan: 3.50, Rice: 2.00 }) }

    it 'will return 0 if nothing is in the basket' do
      expect(subject.total(menu)).to eq 0
    end

    it 'will return the price of a dish in the basket' do
      subject.add_dish('Korma')
      expect(subject.total(menu)).to eq 5
    end

    it 'will return the total sum of all dishes in the basket' do
      subject.add_dish('Korma')
      subject.add_dish('Naan', 2)
      expect(subject.total(menu)).to eq 12
    end
  end
end
