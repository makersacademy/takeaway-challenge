require 'takeaway'

describe Takeaway do
  
  context 'being able to use takeaway' do

    it "exists" do
      expect(subject).to eq subject
    end

    it "displays a list of the dishes with price" do
      expect(subject.menu).to eq({ "pelmeni" => 6.99, "borscht" => 4.99, 
      "salat" => 5.99, "olivier" => 9.99, "tvarog" => 2.99, "smetyana" => 1.99 })
    end

  end
  
  context 'being able to select food and check basket' do
    
    it "allows user to select choice with amount" do
      expect(subject.order("pelmeni", 2)).to eq "2x - Pelmeni added to basket."
    end

    it "checks to make sure food item is on menu" do
      expect { subject.order("a racecar", 9000) }.to raise_error "Sorry, we don't have that item."
    end

    it "checks to see the order total" do
      subject.order("olivier", 2)
      subject.order("borscht", 1)
      expect(subject.order_total).to eq "£24.97"
    end

    let(:takeaway) { described_class.new }
    let(:message) { double :Message, send_text: "Thanks. Your total is £24.97. It'll be there by 12 pm."}

    it "gets a text confirming that my order has been placed" do
      takeaway.order("olivier", 2)
      takeaway.order("borscht", 1)
      expect(takeaway.order_confirmation(message)).to eq "Thanks. Your total is £24.97. It'll be there by 12 pm."
    end
  end
end
