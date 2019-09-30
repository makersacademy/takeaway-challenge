require 'customer_interface'

describe Interface do
  subject(:interface){described_class.new}
  let(:customer_input) { "1" }

  describe '#request_input' do
    it "should request input from the customer" do
      option1 = interface.request_input(customer_input)
      expect(option1).to eq "shows dish menu"
    end
    it "advises if an input was not successful" do
      expect(interface.request_input("goat")).to include "Sorry"
    end
  end

end
