require 'takeaway'
require 'twilio-ruby'


describe Takeaway do
  it 'should display dishes and prices' do
  expect(subject.menu).to eq("dish 1" => 5,
  "dish 2" => 7,
  "dish 3" => 9)
  end

  it 'should add new dish (fish, £5) to menu' do
    name = "fish"
    price = 5
    subject.add_dish(name, price)
    expect(subject.menu).to include(name)
  end

  it 'should contain selected dishes' do
    expect(subject.selected_dishes("dish 1")).to eq(["dish 1"])
  end

  it 'should totalise price of order' do
    subject.selected_dishes("dish 1")
    subject.selected_dishes("dish 2")
    expect(subject.final_sum).to eq 12
  end

  it 'should show the final order and the total sum' do
    subject.add_dish("fish", 5)
    subject.add_dish("chips", 3)
    subject.selected_dishes("fish", "chips")
    expect(subject.check_order).to eq([{"fish"=>5, "chips"=>3}, 8])
  end

  it 'should respond to text' do
    expect(subject).respond_to? :text
  end

  it 'should respond to place order' do
    subject.add_dish("fish", 5)
    subject.add_dish("chips", 3)
    subject.selected_dishes("fish", "chips")
    subject.place_order
    expect(subject).respond_to? :place_order
  end
end