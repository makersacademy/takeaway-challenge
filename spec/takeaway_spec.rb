require "takeaway.rb"

describe Takeaway do
  
  describe "#menu" do
    it "returns a list of dishes and prices" do
      expect(subject.menu.size).to eq(5)
    end
  end

  describe "#print_menu" do
    it "prints menu" do
      expect{subject.print_menu(subject.menu)}.to output.to_stdout
    end
  end

  describe "#print_menu" do
    it "prints menu" do
      expect{subject.print_menu(subject.menu)}.to output(a_string_including("CTM: Chicken Tikka Masala - £5")).to_stdout
    end
  end

  describe "#order" do
    it "creates an array of the order" do
      expect(subject.order("CTM", 3)).to eq([{"CTM" => 3}])
    end
  end



end