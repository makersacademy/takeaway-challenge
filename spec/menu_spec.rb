require 'menu'


describe Menu do

  describe '#print_items' do
    it 'should display a list of the current items in the menu in the correct format, with a title' do
      stub_const("Menu::ITEMS", [{category: "Appetiser", description: "Salt and Pepper Prawns", price: 5.00}])
      expect(STDOUT).to receive(:puts).with("Item Number    Category       Description                             Price (£) ")
      expect(STDOUT).to receive(:puts).with("1              Appetiser      Salt and Pepper Prawns                  5.00      ")
      subject.print_items
    end
  end

  describe '#menu_format' do
    it 'formats the menu when given values' do
      expect(subject.menu_format("First","Second","Third","Fourth")).to eq "First          Second         Third                                   Fourth    "
    end
  end

end