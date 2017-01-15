require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe "defaults" do

    it "initiates with an empty array for @items" do
      expect(menu.items).to eq []
    end
  end

  describe "#view_menu" do

    it { is_expected.to respond_to(:view_menu)}

    context "when there are no dishes in the menu" do
      it "is expected to raise an error" do
        expect {subject.view_menu}.to raise_error("There are no dishes currently available")
      end
    end
  end

  describe "#add_to_menu" do

    it {is_expected.to respond_to(:add_to_menu).with(2).arguments}

    it "adds the dish and price information to the menu when provided by user" do
      menu.add_to_menu("Mushroom Pizza", 5.99)
      expect(menu.items).to include({"Mushroom Pizza" => 5.99})
    end
  end

  describe "#import_items" do

    it {is_expected.to respond_to(:import_items)}

    context "when a list of dishes and prices is provided" do
      it "will import the list of dishes and prices and save them to @menu" do
        subject.import_items
        expect(subject.items.length).to eq 8
      end
    end
  end
end
