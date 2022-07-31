require "takeaway"

=begin


  let(:menu) { double(:menu, :list => "Breakfast £2", :dishes => { "Breakfast" => 2 }) }
  let(:sms) { double(:sms) }
  subject { Takeaway.new(menu) }

  context "menu functionalities" do
    
    it "has a menu" do
      expect(subject).to have_attributes(:menu => menu)
    end

    it "shows the menu" do
      expect { subject.show_menu }.to output("Breakfast £2").to_stdout 
    end
  end

end

=end
describe Takeaway do
    it "starts an order" do
      subject.add_to_basket
      expect(subject.instance_variable_get(:@basket)).to be_truthy
    end

=begin    
    it "gives error if non existent dish is ordered" do
      expect { subject.add_to_basket }.to raise_error("Error. Please enter a valid dish.")
    end

    it "send sms message" do
      allow(sms).to receive(:send_sms)
      subject.add_to_order("Breakfast")
      expect(sms).to receive(:send_sms)
      subject.finalize_order(sms)
    end
=end
    it "lists options" do
      expect { subject.options }.to output { 
        "1. See menu.\n2. Add dishes to order.\n3. View basket.4. Checkout\n"
      }.to_stdout
    end

end 

