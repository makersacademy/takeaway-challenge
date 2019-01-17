require 'takeaway'
require 'menu'

describe Takeaway do

  subject(:takeaway) { described_class.new(@menu) }

  before(:all) do
    @list = { coconut_rice: 2, lassee: 1.5 }
    @menu = Menu.new(@list)
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  context 'customers should be able to view the menu' do

    it 'should show customers a menu' do
      expect(subject.menu).to eq(@list)
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'should allow customers to select dishes' do
    takeaway.order('coconut_rice')
    takeaway.order('coconut_rice')
    takeaway.order('lassee')
    takeaway.order('lassee', 3)
    expect(takeaway.print_basket).to eq("coconut_rice x 2 (£4), lassee x 4 (£6.0)\nThe total is £10.0")
 end



end
