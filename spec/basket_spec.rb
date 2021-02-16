require 'basket'

describe Basket do
  describe '#store' do
    it 'stores item into the basket' do
      expect{ subject.store("katsu curry", 1, 6.00) }.to output("1 x katsu curry has been added to your basket\n").to_stdout
    end
  end

  describe '#show_basket' do
    it 'shows the contents of the basket' do
      subject.store("katsu curry", 1, 6.00)
      expect { subject.show_basket }.to output("katsu curry x 1 = 6.00\n").to_stdout
    end
  end

  describe '#total' do
    it "calculates the total price of the basket's contents" do
      subject.store("katsu curry", 1, 6.00)
      subject.store("katsu curry", 1, 6.00)
      expect(subject.total).to eq(12.00)
    end
  end
end
