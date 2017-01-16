require 'bill'

describe Bill do
  subject(:bill) {described_class.new}
  let(:menu) { double(:menu) }
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#calculate' do
    it {is_expected.to respond_to(:calculate).with(1).argument}

    it 'checks total amount calculation' do
      allow(menu).to receive(:load_dishes)
      dishes = [ ["Supa Minestrone", 3],
                  ["Margherita", 3],
                  ["Pepperoni", 4]
                ]
      expect(bill.calculate(dishes)).to eq(10)
    end
  end
end
