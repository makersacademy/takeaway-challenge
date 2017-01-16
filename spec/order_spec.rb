require 'order'

describe Order do
  subject(:order){described_class.new}
  let(:bill){double(:bill)}
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#calculate_total' do
    it {is_expected.to respond_to(:calculate_total)}
  end
end
