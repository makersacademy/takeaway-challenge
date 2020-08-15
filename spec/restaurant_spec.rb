require "restaurant"

describe Restaurant do 
  
  it { expect(subject).to respond_to(:customers) }

  describe "#menu" do 
    it { expect(subject).to respond_to(:menu) }
    it "Return list with menu" do 
      expect(subject.menu.length).to be > 0
    end
  end
  
  describe "#print_bill" do 
    it { expect(subject).to respond_to(:print_bill) } 
    it "prints the bill for the last order" do 
      expect{subject.print_bill(["pizza", "soup"])}.to output("Your Order: \n1. Pizza - Price: 12\n2. Soup - Price: 3\nTotal: 15\n").to_stdout
    end
  end
  
  it { expect(subject).to respond_to(:confirmation) }


end