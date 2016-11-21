require 'message'

describe Message do

  describe '#text' do
    subject(:message) { described_class.new }


    it "should respond with a confirmation message if it works" do
      expect(subject.text).to eq "Thank you for your order. A text message confirming the order is on its way."
    end

  end

end
