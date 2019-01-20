require 'order'

RSpec.describe Order do

  it 'confirms line of order' do
    expect{subject.add_to_order("pizza")}.to output("Added pizza to your order.\n").to_stdout
  end

  it 'adds to basket' do
    subject.add_to_order("fish")
    expect(subject.basket).to eq(["fish"])
  end

  it 'can add order price to array' do
    subject.add_to_order("curry")
    subject.add_to_order("pizza")
    subject.add_to_order("chips")
    subject.tally_order
    expect(subject.order_amount).to eq([7, 5, 2])
  end

  it 'can sum the order tally' do
    subject.add_to_order("curry")
    subject.add_to_order("chips")
    subject.tally_order
    expect(subject.sum_total_order).to eq(9)
  end

  end
