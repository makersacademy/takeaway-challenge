require 'order'

RSpec.describe Order do

  it 'confirms line of order' do
    expect{subject.add_to_order("pizza")}.to output("Added pizza to your order.").to_stdout
  end

  it 'adds to basket' do
    subject.add_to_order("fish")
    expect(subject.basket).to eq(["fish"])
  end

  it 'can add order price to array' do
    subject.add_to_order("curry")
    subject.add_to_order("curry")
    expect(subject.tally_order).to eq([7, 7])
  end

  end
