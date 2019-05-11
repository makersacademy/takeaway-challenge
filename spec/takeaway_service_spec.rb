require 'takeaway_service'

describe TakeawayService do
  subject(:takeaway_service) { described_class.new }
  let(:menu) { double(:menu, view: message) }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:message) { "Starters:\nOnion soup - £3.50\nPotato fritter - £4\nMains:\nRoast chicken - £8.50\nVegetarian Lasagne - £7.50\nDeserts:\nApple Crumble - £3.50\nVanilla Icecream - £3\n" }

  it 'responds to #view_menu' do
    expect(takeaway_service).to respond_to(:view_menu)
  end

  describe '#view_menu' do
    it 'prints a menu to the console' do
      expect { takeaway_service.view_menu }.to output(menu.view).to_stdout
    end
  end
end
