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


end
