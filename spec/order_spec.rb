require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:chow_mein) {"Chow Mein"}
  let(:basket) {[chow_mein, chow_mein]}

  describe "#choosing a dish" do

    it "asks what dish they would like" do
      expect{subject.order_greeting}.to output("What dish would you like?\nyou can choose from the following:\n\n").to_stdout
    end

    it "lists available dishes" do
      expect(subject.begin_order).to include(chow_mein)
    end

  end
  
  let(:basket) {[chow_mein, chow_mein]}
  describe "#finishing order" do

    it "puts order in the basket basket" do
      expect(subject.basket).to include{[chow_mein, chow_mein]}
    end


    xit "totals the order" do
      expect(subject.total).to eq 10
    end

  end
end
