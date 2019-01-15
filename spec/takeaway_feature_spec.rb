require 'takeaway'
require 'menu'

describe Takeaway do

  subject(:takeaway) { described_class.new(Menu.new) }

  before(:all) do
    @menu = Menu.new(@list)
    @list = { coconut_rice: 2, lassee: 1.5 }
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  context 'customers should be able to view the menu' do

    it 'should show customers a menu' do
      expect(subject.menu).to eq(@list)
    end
  end
end
