require 'customer_interface'

describe Interface do
  subject(:interface){described_class.new}
  let(:option_one) { "1" }
  let(:option_two) { "2" }
  let(:option_three) { "3" }
  let(:option_four) { "4" }
  let(:option_five) { "5" }

  describe '#request_input' do
    it "customer picks 1 - should display food menu customer" do
      expect(interface.request_input(option_one)).to eq "menu printed."
    end

    it "customer picks 2 - should be able to add a dish to their order" do
      expect(interface.request_input(option_two)).to eq "added to order!"
    end

    it "customer picks 3 - prints out the customer's order so far" do
      expect(interface.request_input(option_three)).to be_empty
    end

    it "customer picks 4 - prints out the customer's total so far" do
      interface.add_dish("cod", 2)
      interface.add_dish("haddock")
      interface.add_dish("chips", 3)
      expect(interface.request_input(option_four)).to eq 28
    end

    it "customer picks 5 - prints out the customer's order so far" do
      expect(interface.request_input(option_five)).to include "Thank you!"
    end

    it "advises if an input was not successful" do
      expect(interface.request_input("goat")).to include "Sorry"
    end
  end
end
