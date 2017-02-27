require 'takeaway'
require 'spec_helper'


describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }

  describe "#defaults" do
    it "loads dishes from menu.csv" do
      expect(takeaway.menu.list.count).to eq 21
    end
  end

  describe "#view_menu" do
    it "displays the list of dishes" do
      expect { takeaway.view_menu }.to output.to_stdout
    end
  end

  context "adding an order" do
    before :each do
      takeaway.create_order
    end

    describe "#begin_order" do
      it "creates a new order" do
        expect(takeaway.current_order).not_to be nil
      end
    end

    describe "#select_dish" do
      it "adds the selected dish to the order" do
        allow(takeaway.current_order).to receive(:create_dish).and_return(dish)
        takeaway.select_dish(3)
        expect(takeaway.current_order.basket).to eq([dish])
      end

      it "raises an error if user has not created an order" do
        takeaway = Takeaway.new
        expect{takeaway.select_dish(3)}.to raise_error "Please create an order before selecting dishes"
      end
    end

    describe "#proceed_to_checkout" do
      it "gets the total and shows the items in the basket" do
        takeaway.select_dish(3)
        takeaway.select_dish(1)
        expect{takeaway.proceed_to_checkout}.to output.to_stdout
      end

      it "raises an error if nothing has been added to basket" do
        expect{takeaway.proceed_to_checkout}.to raise_error "Basket is empty"
      end

      describe "#place_order" do
        it "raises an error if nothing has been added to basket" do
          expect{takeaway.place_order}.to raise_error "Basket is empty"
        end
      end
    end
  end
end
