require 'menu'


describe Menu do

  it {is_expected.to respond_to(:list_items)}

  it 'should display a list of the current items in the menu in the correct format' do
    stub_const("Menu::ITEMS", [{category: "Appetiser", description: "Salt and Pepper Prawns", price: 5.00}])
    expect(STDOUT).to receive(:puts).with('1. Appetiser | Salt and Pepper Prawns | Price: 5.0')
    subject.list_items
  end

end