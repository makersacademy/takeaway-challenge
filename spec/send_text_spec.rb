require 'send_text'

describe SendText do
  describe "#tester" do
    it "checks that account_sid includes substring" do
      expect(subject.tester.account_sid).to include("65f1e6d87a214fd24")
    end
  end 


end