require 'menu'

describe Menu do

  # --------------------------------- NAMED SUBJECT ----------------------------------

  subject(:menu) { described_class.new }

  # -------------------------------- MOCKING/STUBBING --------------------------------

  before(:each) {
    @menu_list = "Margherita Pizza (£8.45); Spaghetti Carbonara (£10.75); Calzone (£12.45); Spaghetti Bolognese (£9.95); Caprese Salad (£4.35); King Prawn Linguine (£12.95); Italian Hot Pizza (£10.25); Chicken Ceasar Salar (£10.5); Lasagne (£10.95); Mushroom Risotto (£11.95); Penne Arrabbiata (£9.95); Salad Nicoise (£5.65)"
  }

  # ---------------------------------- ACTUAL TESTS ----------------------------------
  
  it 'should respond to the method see_dishes' do
    expect(menu).to respond_to(:see_dishes)
  end

  it 'should return a string when calling the method see_dishes' do
    expect(menu.see_dishes).to be_a_kind_of(String)
  end

  it 'should return a string of dishes when calling see_dishes' do
    expect(menu.see_dishes).to eq(@menu_list)
  end

end
