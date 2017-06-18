require "menu.rb"

describe Menu do

  describe '#initialize' do
    it 'has a list of menu items' do
      expect(subject.menu).to include({ menu_item: :vegetarian_enchiladas, price: 9.99 })
    end
  end

  describe '#print_menu' do

    it 'prints out the menu to standard output' do
      expect { subject.print_menu }.to output.to_stdout
    end

    it 'prints out a list of the dishes' do
      expect(STDOUT).to receive(:puts).exactly(subject.menu.count).times
      subject.print_menu
    end
  end
end
