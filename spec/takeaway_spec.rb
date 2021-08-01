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

    it "does not accept non-existent items" do
      expect{subject.order("test")}.to output.to_stdout
    end
  end

  describe "#total" do
    it "returns the total for the order with breakdown" do
      t1 = Takeaway.new
      t1.order("CTM", 3)
      t1.order("PPD", 2)
      expect{t1.total}.to output(a_string_including("CTM = £15\nPPD = £2\nTotal = £17")).to_stdout
    end
  end

  describe "#checkout" do
    
    it "puts a message saying the order has been placed" do
      t1 = Takeaway.new
      t1.order("CTM", 3)
      expect{t1.checkout}.to output(a_string_including("Your order has been placed!")).to_stdout
    end
  end



end