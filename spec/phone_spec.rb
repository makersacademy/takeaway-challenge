require "phone"
describe Phone do
  describe "#send_confirmation_text" do
    it "sends a text" do
      expect{subject.send_confirmation_text 5}.not_to raise_error
    end
  end
end
