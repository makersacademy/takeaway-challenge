require 'takeaway'
require 'menu'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }

  context '#show_menu' do
    it 'ensure the menu correclty displays for the customer' do
      takeaway = Takeaway.new(menu)
      expect(menu).to(receive(:print_menu))
      takeaway.display_menu
    end
  end
end
