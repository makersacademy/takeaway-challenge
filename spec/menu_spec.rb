require 'menu'
require 'spec_helper'


describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_file) { 'menu.csv' }
  let(:dish) { double(:dish) }
  # let(:order) {double(:order)}


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

  describe "#begin_order" do
    it "creates a new order" do
      menu.begin_order
      expect(menu.current_order).not_to be nil
    end
  end

  # describe "#select_dish" do
  #   it "adds the selected dish to the order" do
  #     menu.select_dish(dish)
  #     expect(menu.order.view_order).to contain(dish)
  #   end
  # end

end



end
