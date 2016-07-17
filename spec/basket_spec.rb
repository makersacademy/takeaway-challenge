require 'basket'


describe Basket do

  subject {described_class.new}
  let(:takeaway) {double(:takeaway)}
  let(:item) {{name: "Edamame", quantity: 3, price: 6.00}}

  describe '#total_price' do

    it 'has no total when instatiated' do
      expect(subject.total_price).to eq(0)
    end

    it 'sums the total of all items in the basket' do
      subject.add(item)
      subject.add(item)
      expect(subject.total_price).to eq 12.00
    end

  end

  describe '#add' do

    it {is_expected.to respond_to(:add).with(1).argument}

    it 'adds items to the basket' do
      subject.add(item)
      expect(subject.items).to include item
    end

    it 'increments item count' do
      expect{subject.add(item)}.to change{subject.item_count}.by(3)
    end
  end

end
