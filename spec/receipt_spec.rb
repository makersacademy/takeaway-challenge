require 'receipt'

describe Receipt do
    let(:message)     { "Thanks you!You paid #{total} and your order was placed and will be delivered before 18:52!\n" }
    let(:total)      { 21 }
  
    subject(:receipt) { described_class.new }
  
    it "prints a receipt" do
      expect { receipt.print(total) }.to output(message).to_stdout
    end
  end