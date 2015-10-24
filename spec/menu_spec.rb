require 'menu'


describe Menu do

  describe '#print_items' do
    it 'should display a list of the current items in the menu in the correct format, with a title' do
      stub_const("Menu::MENU", [{category: "Appetiser", description: "Salt and Pepper Prawns", price: 5.00, quantity: 0}])
      expect(STDOUT).to receive(:puts).with("Item Number    Description                             Price (£) Quantity  ")
      expect(STDOUT).to receive(:puts).with("1              Salt and Pepper Prawns                  5.00      0         ")
      subject.print_items
    end
  end

  describe '#menu_format' do
    it 'formats the menu when given custom values' do
      expect(subject.menu_format("First","Second","Third","Fourth")).to eq "First          Second                                  Third     Fourth    "
    end
  end
  describe '#compare_cost' do
    it 'correctly identifies if the customer stated item_num price is different to the menu' do
      expect(subject.menu_price_diff(3,4)).to eq false
    end
  end
end