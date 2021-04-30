require 'takeaway'
describe TakeAway do
  subject(:takeaway) {described_class.new(menu: menu, order: order)} # argument of the class (initialize method )

  let(:menu) {double(:menu, print: printed_menu )} # when puting let we are giving an initialize argument to the class . How the subject and described_class works? what this is called?
  let(:order) { instance_double("Order ", total: 15.50)}
  let (:printed_menu) { "Chicken: £3.50"}

  let(:dishes) { {chicken: 2, bread: 1} }

  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq("Chicken: £3.50")
end

it "can order some number of several available dishes" do #I would like to be able to select some number of several available dishes
  expect(order).to receive(:add).twice
  takeaway.place_order(dishes)
end

it 'knows the order total'do
  allow(order).to receive(:add)
  total = takeaway.place_order(dishes)# the error message is not showing this variable.
  expect(total).to eq(15.50)
  end
end















#let
