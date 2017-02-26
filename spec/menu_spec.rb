require 'menu'
require 'spec_helper'


describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_file) { 'menu.csv' }
  let(:dish) { double(:dish) }



  it { is_expected.to respond_to(:load_menu)}
  it { is_expected.to respond_to(:view_price_list)}

  context "defaults" do

    it "list starts as an empty array" do
      expect(menu.list).to be_empty
    end

  end

  context "loaded menu" do
    before :each do
      menu.load_menu
    end

    describe "#load_menu" do
      it "loads dishes from menu.csv" do
        expect(menu.list.count).to eq 21
      end
    end

    describe "#view_price_list" do
      it "displays the list of dishes" do
        expect { menu.view_price_list }.to output.to_stdout
      end
    end

    context "adding an order" do
      before :each do
        menu.begin_order
      end

    describe "#begin_order" do
      it "creates a new order" do
        expect(menu.current_order).not_to be nil
      end
    end

    describe "#select_dish" do
      it "adds the selected dish to the order" do
        menu.select_dish(3)
        expect(menu.current_order.basket).to eq([{:name => "Margherita", :price => 8.95, :quantity => 1}])
      end
    end

    describe "#proceed_to_checkout" do
      before :each do
        menu.select_dish(3)
        menu.select_dish(1)
      end
      it "gets the total and shows the items in the basket" do
        expect(menu.proceed_to_checkout).to eq(21.90)
      end

    end
  end
  end




end
