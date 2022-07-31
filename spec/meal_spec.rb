require_relative "../lib/meal.rb"
require_relative "../lib/menu.rb"

RSpec.describe Meal do
  let(:customer_order) { [:avocado_maki, :katsu_curry, :miso_soup] }
  describe "#order" do
    it "stores a dish" do
      subject.order([:salmon_sashimi])
      expect(subject.dishes).to include [:salmon_sashimi]
    end

    it "stores an array of selected dishes" do
      subject.order(customer_order)
      expect(subject.dishes).to include customer_order
    end
  end

  describe "#total" do
    it "returns the price of a dish" do
      subject.order(:avocado_maki)
      expect(subject.total).to eq 4
    end

    it "returns the total of the customer's order" do
      subject.order(:avocado_maki, :katsu_curry, :miso_soup)
      expect(subject.total).to eq 16
    end
  end
end
