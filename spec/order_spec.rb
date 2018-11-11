# encoding: UTF-8
require "order.rb"

describe Order do

	let (:dish_name) {double :dish_name}

	it "raise warning if dish not exist on menu" do
		expect(subject.take_order("something",1)).to eq "No such dish"
	end

  it "sub_total calculate the add up of the order 10 * 3" do
    expect(subject.sub_total("beer",10)).to include 30
  end

  # it "calculate the total if more item added" do # after update ruby version
  #   subject.take_order("chicken", 1)
  #   subject.take_order("beer", 10)
  #   expect(subject.cal_total).to include 36
  # end

  it "raise warning if no order is added" do
    expect(subject.completed?).to eq "No order has been added"
  end

  it "return true after order completed" do
    subject.take_order("beer", 10)
    expect(subject.completed?).to eq true
  end

  it "print order total and order list after order completed" do
    subject.take_order("beer", 10)
    expect(subject.print_receipt).to include "10 beer -- £30"
  end

end