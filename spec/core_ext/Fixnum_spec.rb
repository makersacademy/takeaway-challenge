require "./lib/core_ext/Fixnum"
describe Fixnum do
  describe "#to_pounds_and_pence" do
    subject{543}
    it "converts 543 to £5.43" do
      subject = 543
      expect(subject.to_pounds_and_pence).to eq "£5.43"
    end
    subject{0}
    it "converts 0 to £0.00" do
      subject = 0
      expect(subject.to_pounds_and_pence).to eq "£0.00"
    end
  end
end
