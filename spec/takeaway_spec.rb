require 'takeaway'

describe Takeaway do

  let(:subject) { Takeaway.new({cat: 1234, dog: 808, foo: 9}) }
  let(:blank_menu) { Takeaway.new({}) }

  it "presents the menu" do
    expect(subject.present_menu).to eq "Cat: £12.34, Dog: £8.08, Foo: £0.09"
  end

  it "apologises for a blank menu" do
    expect(blank_menu.present_menu).to eq "Sorry – no items on the menu today"
  end

  it "selects an item with default quantity 1" do
    subject.select_item(:cat)
    expect(subject.present_selection).to eq "Cat: 1"
  end

  it "selects multiple quantities of an item" do
    subject.select_item(:dog, 2)
    expect(subject.present_selection).to eq "Dog: 2"
  end

  it "removes items if selected with quantity 0" do
    subject.select_item(:foo, 0)
    expect(subject.present_selection).to eq "You haven't selected anything"
  end

  it "presents the selection" do
    subject.select_item(:cat)
    subject.select_item(:dog, 2)
    subject.select_item(:foo, 0)
    expect(subject.present_selection).to eq "Cat: 1, Dog: 2"
  end

  it "warns if nothing has been selected" do
    expect(subject.present_selection).to eq "You haven't selected anything"
  end

  it "presents the total cost of the selection" do
    subject.select_item(:cat)
    subject.select_item(:dog, 2)
    subject.select_item(:foo, 7)
    expect(subject.present_total).to eq "Your order costs £29.13"
  end

  it "accepts an order with the correct payment" do
    subject.select_item(:cat)
    subject.select_item(:dog, 2)
    subject.select_item(:foo, 7)
    expect(subject.place_order(2913)).to eq "Your order of £29.13 is accepted"
  end

  it "raises an error if the payment is incorrect" do
    subject.select_item(:cat)
    subject.select_item(:dog, 2)
    subject.select_item(:foo, 7)
    expect{subject.place_order(2912)}.to raise_error("Payment of £29.12 for order of £29.13")
  end

end
