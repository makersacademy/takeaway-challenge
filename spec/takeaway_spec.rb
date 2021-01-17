require 'takeaway'
describe Takeaway do

  describe '#menu' do
    subject(:takeaway) { described_class.new(menu) }

    let(:menu) { double(:menu, display: show_menu) }
    let(:show_menu) { "Korma: £5.00\n" }

    it 'shows a list of dishes with prices' do
      expect { takeaway.show_menu }.to output(show_menu).to_stdout
    end
  end

  describe '#check_basket' do
    subject(:takeaway) { described_class.new(menu) }
    let(:menu) { double(:menu, :dishes => { Korma: 5.00, Naan: 3.50, Rice: 2.00 }) }

    it "will display nothing when initialised" do
      expect(takeaway.check_basket).to be_empty
    end

    it 'will display the dish when added to the basket' do
      takeaway.order('Korma')
      expect(takeaway.check_basket).to include('Korma'.to_sym)
    end
  end

  describe '#order' do
    subject(:takeaway) { described_class.new(menu) }
    let(:menu) { double(:menu, :dishes => { Korma: 5.00, Naan: 3.50, Rice: 2.00 }) }
    let(:basket) { double(:basket, contents: []) }

    it "confirms that your order has been added" do
      expect { takeaway.order('Korma') }.to output("1x Korma(s) added to basket\n").to_stdout
    end

    it "adds the item to basket" do
      takeaway.order('Korma')
      expect(takeaway.check_basket['Korma'.to_sym]).to eq 1
    end

    it "raises an error if that dish is not on the menu" do
      expect { takeaway.order('Vinderloo') }.to raise_error "This item is not available on the menu"
    end
  end

  describe '#order_total' do
    subject(:takeaway) { described_class.new(menu) }
    let(:menu) { double(:menu, :dishes => { Korma: 5.00, Naan: 3.50, Rice: 2.00 }) }
    let(:basket) { double(:basket, contents: []) }

    it 'will return 0 if you have nothing in the basket' do
      expect(takeaway.order_total).to eq "£0.00"
    end

    let(:basket) { double(:basket, total: 16) }
    it 'will return the correct total for the baskets contents' do
      takeaway.order('Korma', 2)
      takeaway.order('Rice', 3)
      expect(takeaway.order_total).to eq "£16.00"
    end
  end

  describe '#order_summary' do
    subject(:takeaway) { described_class.new(menu) }
    let(:menu) { double(:menu, :dishes => { Korma: 5.00, Naan: 3.50, Rice: 2.00 }) }
    let(:basket) { double(:basket, contents: []) }

    it "will puts the current order to the stdout" do
      takeaway.order('Korma', 2)
      takeaway.order('Rice', 3)
      expect { takeaway.order_summary }.to output("2x Korma, \n3x Rice \nOrder total = £16.00\n").to_stdout
    end
  end
end
