require 'takeaway'

describe Takeaway do
  subject(:thai) { described_class.new }
  let(:dishes) { { "Green Curry" => 2, "Rice" => 2 } }
  let(:dish1) { "Green Curry" }
  let(:quantity) { 2 }
  let(:dish2) { "Rice" }
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

  describe '#order' do
    it 'creates the order' do
      thai.order(dish1, quantity)
      expect(thai.order(dish2, quantity)).to eq dishes

    end
  end

end
