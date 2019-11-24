require 'menu'

describe Menu do

  before do
    subject.pass_csv_to_table
  end
  describe 'display' do
    it 'should display the dishes and prices on the menu' do
      expect { subject.display }.to output("Burger £4\nChips £2\nPizza £7\nBurrito £6\nSalad £6\nLobster £15\nSirloin Steak £18\n").to_stdout
    end
  end
  describe 'populate' do
    # how to test? change menu_list size by how many items on the list?
    it 'should populate the menu list' do
      expect { subject.populate }.to change{subject.menu_list.size}.by (7)
    end
  end
end
