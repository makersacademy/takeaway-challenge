require 'takeaway'

describe Takeaway do

  # ------------------------------------ DOUBLES -------------------------------------

  let(:menu) { double("Menu") }
  let(:basket) { double("Order") }

  # --------------------------------- NAMED SUBJECT ----------------------------------

  subject(:takeaway) { described_class.new(menu) }

  # -------------------------------- MOCKING/STUBBING --------------------------------

  before(:each) {
    @example_order = "Lasagne (£10.95); Mushroom Risotto (£11.95)"
    @menu_list = "
      Margherita Pizza (£8.45); Spaghetti Carbonara (£10.75);
      Calzone (£12.45); Spaghetti Bolognese (£9.95);
      Caprese Salad (£4.35); King Prawn Linguine (£12.95);
      Italian Hot Pizza (£10.25); Chicken Ceasar Salar (£10.5);
      Lasagne (£10.95); Mushroom Risotto (£11.95);
      Penne Arrabbiata (£9.95); Salad Nicoise (£5.65)"
    allow(menu).to receive(:see_dishes).and_return(@menu_list)
    allow(basket).to receive(:see_order).and_return(@example_order)
    allow(basket).to receive(:confirm_order)
  }

  # ---------------------------------- ACTUAL TESTS ----------------------------------

  it 'should respond to see_menu' do
    expect(takeaway).to respond_to(:see_menu)
  end

  it 'should return a string when calling see_menu' do
    expect(takeaway.see_menu(menu)).to be_a_kind_of(String)
  end

  it 'should return a string of dishes when calling see_menu' do
    expect(takeaway.see_menu(menu)).to eq(@menu_list)
  end

  it 'should respond to select_dishes' do
    expect(takeaway).to respond_to(:select_dishes)
  end

  it 'should change the basket when calling select_dishes' do
    expect{ takeaway.select_dishes("Lasagne", 1) }.to change { takeaway.basket }
  end

  it 'should raise an error if the wrong total is passed to select_dishes' do
    expect{ takeaway.select_dishes("Calzone", "Lasagne", 1) }.to raise_error("You've entered 2 dishes rather than the 1 that you expected!")
  end

  it 'should respond to the method view_order' do
    expect(takeaway).to respond_to(:view_order)
  end

  it 'should return a string when calling view_order' do
    expect(takeaway.view_order(basket)).to be_a_kind_of(String)
  end

  it 'should return a string of dishes when calling view_order' do
    expect(takeaway.view_order(basket)).to eq(@example_order)
  end

  it 'should respond to the method place_order' do
    expect(takeaway).to respond_to(:place_order)
  end

  it 'should change the basket when calling place_order' do
    takeaway.select_dishes("Lasagne", 1)
    expect{ takeaway.place_order(basket) }.to change { takeaway.basket }
  end

end
