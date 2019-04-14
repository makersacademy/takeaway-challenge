require 'order'

describe Order do
  describe '#add' do
    it "adds to order" do
      subject.add("pizza", 2)
      expect(subject.basket).to eq({ "pizza" => 2 })
    end
  end

  describe '#summary' do
    it "pretty prints order summary" do
      subject.add("pizza", 2)
      expect { subject.summary }.to output("2x pizza(s) - £20\n").to_stdout
    end
  end

  describe '#total' do
    it "calculates order total" do
      subject.add("pizza", 2)
      expect(subject.total).to eq 20
    end
  end
end
