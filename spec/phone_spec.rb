require './docs/phone.rb'

describe Phone do
#   let(:input) { "input" }
#
    context "#initialize" do
      it "tally amount is set" do
        subject.tally = 3380
      expect(subject.tally).to eq(3380)
    end
  end

#   context "#input_details" do
#     it "takes an input value" do
#       expect(subject.input_details).to receive(:gets).and_return(input)
#     end
#   end

  context "#time" do
    it "shows the time an hour from now"
      # message = "hello"
      # expect{subject.time}.to output(message).to_stdout
      # allow(Time).to receive(:now).and_return(@time_now)
    it "loops the 24 hour clock"
    it "minutes are not single digits"
  end
  context "#text_in_message" do
    it "prints the correct message that is to be texted to the phone"
      # subject.tally = 3380
      # subject.time
      # message = "hi"
      # expect { subject.text_in_message }.to output(message).to_stdout
    #end
  end
end
