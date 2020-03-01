require "menu"

describe Menu do
  include_context "common menu"

  context "initialized instance variable" do
    it "list" do
      expect(subject.instance_variable_get(:@list)).to eql(list)
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
  end

  context "method functionality" do
    it "#print displays the menu" do
      expect{subject.print}.to output("Menu\n\nsoup      £1.99\nchips      £0.5\nramen      £0.9\n").to_stdout
    end
  end
end