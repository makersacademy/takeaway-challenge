describe 'User Stories' do

  let(:takeaway) { Takeaway.new(menu: menu) }
  let(:menu) { Menu.new }

  # Below story was added by myself to remove the need to hard-code in a menu

  # As a restaurant owner,
  # So I can manage the items on my menu
  # I want to be able to add new items to it
  it 'to manage items on my menu, I want to be able to add new items' do
    menu.add_item(:shrimp, 1.88)
    expect(menu.list).to include(shrimp: 1.88)
  end

  # As a restaurant owner,
  # So I can manage what happens when items run out
  # I want to be able to remove existing items on it
  it 'to manage out of stock, I want to be able to remove existing items' do
    menu.add_item(:burger, 2.44)
    menu.remove_item(:burger)
    expect(menu.list).to be_empty
  end


end
