require 'message'

describe Message do

  describe '#text' do

    it "receives a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      subject.text
    end
  end

    # it "should respond with a confirmation message if it works" do
    #   expect(subject.text).to eq "Thank you for your order. A text message confirming the order is on its way."
    # end

  end

end
