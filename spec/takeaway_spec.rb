require 'takeaway'

describe Takeaway do
  
  context "able to take Menu class information and displays" do
    let(:shop) { described_class.new(russian) }
    let(:russian) { 
      double :Menu, 
      current_menu: {
        "pelmeni" => 6.99,
        "borscht" => 5.99
      }
    }

    it "#menu" do
      expect(shop.menu).to eq({
        "pelmeni" => 6.99,
        "borscht" => 5.99
      })
    end
  end

  context 'being able to select food and check basket' do
    
    it "allows user to select choice with amount" do
      # can use without blocks and include part of a string
      expect(subject.order("pelmeni", 2)).to include "2x - Pelmeni added to basket."
    end

    it "checks to make sure food item is on menu" do
      expect { subject.order("a racecar", 9000) }.to raise_error "Sorry, we don't have that item."
    end

    it "checks to see the order total" do
      subject.order("olivier", 2)
      subject.order("borscht", 1)
      # here I check to seee the string includes the total!! 
      expect(subject.order("salat")).to include({ "£17.96" })
    end

    let(:takeaway) { described_class.new }
    let(:message) { double :Message, send_text: "Spacibo!" }

    it "gets a text confirming that my order has been placed" do
      takeaway.order("olivier", 2)
      takeaway.order("borscht", 1)
      expect(takeaway.order_confirmation(message)).to eq("Spacibo! You will receive a text soon confirming your order. Next time, try ordering over text message!")
      # it calls the double here but doesn't the send_text method b/c of our last line
    end

  end
end
