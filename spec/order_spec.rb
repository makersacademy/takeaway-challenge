require 'order'

describe Order do

  # ------------------------------------ DOUBLES -------------------------------------

  let(:messenger) { double("SMS") }

  # --------------------------------- NAMED SUBJECT ----------------------------------

  subject(:order) { described_class.new([
    Dish.new("Lasagne", 10.95),
    Dish.new("Calzone", 12.45)
  ]) }

  # -------------------------------- MOCKING/STUBBING --------------------------------

  before(:each) {
    @dishes = ["Calzone", "Lasagne"]
    @order = "Lasagne (£10.95); Calzone (£12.45)"
    allow(messenger).to receive(:send_text)
  }

  # ---------------------------------- ACTUAL TESTS ----------------------------------

  it 'should respond to the method assign_dishes' do
    expect(order).to respond_to(:assign_dishes)
  end

  it 'should change the items array when calling assign_dishes' do
    expect{ order.assign_dishes(@dishes) }.to change { order.items }
  end

  it 'should respond to the method check_quantity' do
    expect(order).to respond_to(:check_quantity)
  end

  it 'should raise an error if passed the wrong expected_total' do
    expect{ order.check_quantity(1) }.to raise_error("You've entered 2 dishes rather than the 1 that you expected!")
  end

  it 'should respond to the method see_order' do
    expect(order).to respond_to(:see_order)
  end

  it 'should return a string when calling see_order' do
    expect(order.see_order).to be_a_kind_of(String)
  end

  it 'should return a string of dishes when calling see_order' do
    expect(order.see_order).to eq(@order)
  end

  it 'should respond to the method confirm_order' do
    expect(order).to respond_to(:confirm_order)
  end

  it 'should not raise an error when calling confirm_order' do
    expect{ order.confirm_order(messenger) }.not_to raise_error
  end

end
