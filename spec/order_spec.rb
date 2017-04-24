require 'rspec'
require_relative '../lib/order.rb'

describe Order do 
  subject(:order) { described_class.new }

  describe "#add_selection" do
    xit "adds a dish to the order" do
      expect(subject.add_selection).to eq
    end
  end

    describe "#check_selection" do
    xit "returns a list of currently selected dishes" do
      expect(subject.check_selection).to eq
      end
    end

    describe "#check_total" do
    xit "returns the current running total or selected dishes" do
      expect(subject.check_total).to eq
      end
    end

    describe "#order_meal" do
    xit "places order and cofirms delivery time" do
      expect(subject.order_meal).to eq
      end
    end

  end
