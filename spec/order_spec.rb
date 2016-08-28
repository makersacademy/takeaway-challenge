require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:chow_mein){"Chow Mein"}

  describe "#choosing a dish" do

    it "asks what dish they would like" do
      expect{subject.order_greeting}.to output("What dish would you like?\nyou can choose from the following:\n\n").to_stdout
    end

    it "lists available dishes" do
      expect(subject.begin_order).to include(chow_mein)
    end

    it "accepts user input for dish choice" do
       expect(subject.basket[-1]).to include chow_mein
     end

  end
end
