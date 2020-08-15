require "restaurant"

describe Restaurant do 
  
  describe "#new_order" do 
    it { expect(subject).to respond_to(:new_order) }
    it "Return new custumer order" do 
      customer = double("Customer", place_order: ["pizza", "pasta"])
      expect(subject.new_order(customer).length).to eq 2
    end
  end

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

  describe "#send_confirmation" do 

    it { expect(subject).to respond_to(:send_confirmation) }

    it "sends a confirmatio with date and time" do 
      allow(subject).to receive(:Time).and_return("12:21:00")
      expect(subject.send_confirmation).to eq "Thank you! Your order was placed and will be delivered before 13:21"
    end
  end

end