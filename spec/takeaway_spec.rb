require "takeaway"
#note to peer reviewer- I've been using Doubles and stubs for the last couple of weeks,
#I was curious when Katerina mentioned that there's a second school of thought that just uses the normal classes
#I thought I'd give that a try for this project, so it's not that I don't know how to use doubles, I chose not to,
#to see what it would be like.

#my original idea was to have the Order class as just a dumb store for variables, which is why it has so much interaction with TakeAway
#unfortunately, the order class evolved as I developed it and is now more complex.  A next step would be to decouple the order,
#and TakeAway classes, as they are now more separate.

describe TakeAway do
  dish = "fish and chips"
  price = 6.99
  describe "#show_menu" do
    it "displays a list of food with prices" do
      expect{subject.show_menu}.to output("[0]= fish and chips: £6.99\n").to_stdout
    end
  end

  describe "#new_order" do
    it "allows users to create a new order" do
      subject.new_order()
      expect(subject.new_order.class).to eq Order

    end
  end

  describe "#add_to_order" do
    context "when the item is valid" do
      it "allows the user to select a quantity of an item from the menu" do
        subject.new_order
        subject.add_to_order(0,2)
        expect(subject.instance_variable_get(:@order).items[0][:item].dish).to eq "fish and chips"
      end
    end
    context "when the item is invalid" do
      it "throws an error" do
        subject.new_order
        expect{subject.add_to_order("bacon",2)}.to raise_error "invalid item"
      end
    end
  end

  describe "#check_total" do
    it "displays the total of the current order" do
      subject.new_order
      subject.add_to_order(0,2)
      expect(subject.check_total).to eq(subject.instance_variable_get(:@menu)[0].price * 2)
    end
  end

  describe "#submit_order" do
    number = ENV["TO_NUMBER"]
    it "creates a Text instance and sends it" do
      subject.new_order
      subject.add_to_order(0,3)
      expect(subject.submit_order(number).instance_variable_get(:@client).class).to be_an_instance_of Twilio::REST::Client

    end    
    it "confirms that a message has been sent" do
      subject.new_order
      subject.add_to_order(0,3)
      expect(subject.submit_order(number)).to eq("a confirmation message has been sent to #{number}")
      
    end

    it "resets the order variable" do
      subject.new_order
      subject.add_to_order(0,2)
      subject.submit_order(number)
      expect(subject.instance_variable_get(:@order)).to eq nil
      
    end
  end
end