require "menu"

describe Menu do
  include_context "common menu"

  context "initialized instance variable" do
    it "list" do
      expect(subject.instance_variable_get(:@list)).to eq(list)
    end
  end

  context "method responds to" do
    it "#print" do
      expect(subject).to respond_to(:print)
    end
    it "#dish_exists?" do
      expect(subject).to respond_to(:dish_exists?).with(1).arguments
    end
    it "#dish_available?" do
      expect(subject).to respond_to(:dish_available?).with_keywords(:dish, :quantity)
    end
    it "#dish_price" do
      expect(subject).to respond_to(:dish_price).with(1).arguments
    end
  end

  context "method functionality" do
    it "#print displays the menu" do
      expect{subject.print}.to output("Menu\n\nsoup      £1.99\nchips      £0.5\nramen      £0.9\n").to_stdout
    end
    it "#dish_exists? returns false if requested dish does not exists" do
      expect(subject.dish_exists?("disgusting food")).to eql(false)
    end
    it "#dish_exists? returns true if requested dish exists" do
      expect(subject.dish_exists?("chips")).to eql(true)
    end
    it "#dish_available? returns false if ordering greater quantity than is available for selected dish" do
      expect(subject.dish_available?({dish: "chips", quantity: 21})).to eq(false)
    end
    it "#dish_available? returns true if quantity meets availability of dish" do
      expect(subject.dish_available?({dish: "chips", quantity: 20})).to eq(true)
    end
    it "#dish_price returns price of chips, £0.50" do
      expect(subject.dish_price("chips")).to eq(0.5)
    end
  end
end