require 'order'

describe Order do

  subject(:order) {described_class.new}

  describe "#choosing a dish" do

    it "can display available dishes" do
      expect(order.display_dishes).to include("Chow Mein")
    end

    it "asks what dish they would like" do
      expect{subject.order_greeting}.to output("What dish would you like?\nyou can choose from the following:\n\n").to_stdout
    end

    # it "lists available dishes" do
    #   expect{subject.begin_order}.to output("").to_stdout
    # end

  end
end
