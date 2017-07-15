require 'takeaway'

describe Takeaway do
  subject(:thai) { described_class.new }

  # describe '#initialize' do
  #   it 'has a menu' do
  #     expect(thai.menu).to eq Menu::DISHES
  #   end
  # end

  describe '#view_menu' do
    it 'shows the list of dishes with prices' do
      expect { thai.view_menu }.to output("Green Curry: £6\nMassaman Curry: £6\nPanang Curry: £6\nPad Thai: £7\nRice: £2\nPad Pak: £3\nSingha: £4\n").to_stdout
    end
  end

end
