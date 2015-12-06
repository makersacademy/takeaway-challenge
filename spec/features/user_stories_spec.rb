describe 'User Stories' do

  let(:takeaway) { Takeaway.new(menu: menu) }
  let(:menu) { Menu.new }

  # Below stories were added by myself to remove the need to hard-code in a menu

  # As a restaurant owner,
  # So I can manage the items on my menu
  # I want to be able to add new items to it
  it 'to manage items on my menu, I want to be able to add new items' do
    menu.add_item(:shrimp, 1.88)
    expect(menu.dishes).to include(shrimp: 1.88)
  end

  # As a restaurant owner,
  # So I can manage what happens when items run out
  # I want to be able to remove existing items on it
  it 'to manage out of stock, I want to be able to remove existing items' do
    menu.add_item(:burger, 2.44)
    menu.remove_item(:burger)
    expect(menu.dishes).to be_empty
  end

  context 'after the restaurant owner has populated their menu' do
    before(:example) do
      menu.add_item(:burger, 2.44)
      menu.add_item(:shrimp, 1.88)
      menu.add_item(:fries, 1.22)
      menu.add_item(:beef, 4.22)
    end

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'to check what is in offer, I would like to see a list of items' do
      expect(takeaway.read_menu).to include(burger: 2.44, shrimp: 1.88)
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'so I can order my meal, I would like to log items to my order' do
      takeaway.order(:burger, 4)
      takeaway.order(:shrimp, 2)
      expect(takeaway.current_order.list).to include(burger: 4, shrimp: 2)
    end

    it 'I would like to be stopped from ordering items not on menu' do
      expect(takeaway.order(:cat, 3)).to raise_error "You cannot buy cat here"
    end
  end

end
