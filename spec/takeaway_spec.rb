require 'takeaway'
describe Takeaway do

  describe '#menu' do
    subject(:takeaway) { described_class.new(menu) }

    let(:menu) { double(:menu, display: show_menu) }
    let(:show_menu) { "Korma: £5.00" }

    it 'shows a list of dishes with prices' do
      expect(takeaway.show_menu).to eq(show_menu)
    end
  end

  describe '#order' do
    subject(:takeaway) { described_class.new(menu) }
    let(:menu) { double(:menu) }
    let(:basket) { double(:basket, contents: []) }

    it "confirms that your order has been added" do
    expect{ takeaway.order('Korma') }.to output("1x Korma added to basket\n").to_stdout
    end

    it "adds the item to basket" do
      
    end
  end
end
