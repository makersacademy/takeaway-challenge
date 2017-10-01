require './docs/phone.rb'

describe Phone do

  let(:subject) { described_class.new("123", "abc", "144") }

  context "#initialize" do
    it "tally amount is set" do
      subject.tally = 3380
      expect(subject.tally).to eq(3380)
    end
  end

  context "#input_details" do
    it "takes an input value for SID" do
      expect(subject.account_sid).to eq("123")
    end
    it "takes an input value for Auth Token" do
      expect(subject.auth_token).to eq("abc")
    end

    it "takes an input value for Phone Number" do
      expect(subject.phone_number).to eq("144")
    end
  end

  context "#time" do
    it "shows the time an hour from now" do
      allow(subject).to receive(:time) { "15:08" }
      expect(subject.time).to eq("15:08")
    end
    it "minutes are not single digits" do
      allow(subject).to receive(:time) { "15:08" }
      expect(subject.time).to eq("15:08")
    end
  end
  context "#text_in_message" do
    it "prints the correct message that is to be texted to the phone" do
      subject.tally = 3380
      allow(subject).to receive(:time) { "14:08" }
      message = "Your order will arrive at 14:08 and is £3380. Enjoy our heavenly dishes!"
      expect(subject.text_in_message).to eq(message)
    end
  end
end
