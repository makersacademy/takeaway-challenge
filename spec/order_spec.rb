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

    # it "accepts user input for dish choice" do
    #   allow(subject).to receive(:gets).and_return(chow_mein, 2)
    #   subject.record_order
    #   expect(subject.basket[-1]).to include chow_mein
    #  end

  end

  describe "#finishing order" do

    it "totals the contents of the basket" do
      allow(subject).to receive(:basket).and_return([chow_mein, chow_mein])
      subject.total
      expect(subject.absolute_total).to eq 11
    end

  end
end
