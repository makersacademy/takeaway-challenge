require 'order'

describe Order do

  describe '#add' do
    it "adds items to the order if order has not been submitted" do
      expect(subject.add([['rice', 1], ['noodles', 2]])).to eq([['rice', 1], ['noodles', 2]])
    end

    it "returns error if order was previously submitted" do
      subject.add([['rice', 1], ['noodles', 2]])
      subject.submit
      expect{subject.add([['rice', 1], ['noodles', 2]])}.to raise_error("order already submitted")
    end
  end

  describe '#total' do
    it "calculates order total" do
      subject.add([['rice', 1], ['noodles', 2]])
      expect(subject.total).to eq(3)
    end
  end

  describe '#submit' do
    it "changes order status to submitted" do
      subject.add([['rice', 1], ['noodles', 2]])
      subject.submit
      expect(subject.status).to eq("submitted")
    end
  end

end