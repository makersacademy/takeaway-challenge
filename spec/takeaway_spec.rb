require 'rspec'
require './lib/takeaway.rb'

describe Object do
  let(:dish1) {double("fake dish 1", :name => "dish1 name", :price => 40)}
  let(:dish2) {double("fake dish 2", :name => "dish2 name", :price => 50)}
  let(:dish3) {double("fake dish 3", :name => "dish3 name", :price => 60)}

  let(:order) {double("fake customer order", :dishes => [dish1, dish2, dish3])}

  describe "calculate_total" do
    it "calculates the total for an order of three dishes" do
      @customer_order = order
      expect(calculate_total).to eq(150)
    end
  end
end
