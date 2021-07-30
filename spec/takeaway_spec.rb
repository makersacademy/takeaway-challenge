require 'takeaway'

describe TakeAway do
  let(:takeaway) { TakeAway.new }
  let(:menu) {{"Vanilla Milkshake" => 3.99}}
  let(:print_menu) {{"Vanilla Milkshake" => 3.99}}

  ITEM = "Vanilla Milkshake"

  # it 'should create a takeaway' do
  #   expect(takeaway).to respond_to(:read_menu)
  # end

  it 'should have an empty basket' do
    expect(takeaway.basket).to be_empty
  end

  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu)
end

  # it 'should display menu with list of prices' do
  #   expect(takeaway).to respond_to(:read_menu)
  # end

  # it 'should allow someone to add to basket' do
  #   allow(menu).to receive(:read_menu).and_return({ "Vanilla Milkshake" => 3.99 })
  # end

  it 'should respond to order method' do
    expect(takeaway).to respond_to(:order)
  end

  it 'should allow someone to order more than 1 item' do
    expect(takeaway).to respond_to(:order).with(2).arguments
    expect(takeaway.order(ITEM,2)).to eq("2x Vanilla Milkshake(s) has been added to your basket 🧺✔️")
  end
end
