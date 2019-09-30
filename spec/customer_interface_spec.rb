require 'customer_interface'

describe Interface do
  subject(:interface){described_class.new}
  let(:customer_input) { "1" }

  describe '#request_input' do
    it "should request command from customer and execute" do
      option1 = interface.request_input(customer_input)
      expect(option1).to eq "---------------------"
    end
    it "advises if an input was not successful" do
      expect(interface.request_input("goat")).to include "Sorry"
    end
  end

  describe '#view_menu' do
    it "prints out the menu" do
      expect(interface.view_menu).not_to be_empty
    end
  end

end
