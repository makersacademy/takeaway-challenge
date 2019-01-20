require 'order'

RSpec.describe Order do

  it 'confirms line of order' do
    expect{subject.add_to_order("pizza")}.to output("Added pizza to your order.\n").to_stdout
  end

  it 'adds to basket' do
    subject.add_to_order("fish")
    expect(subject.basket).to eq(["fish"])
  end

  it 'can sum the total order' do
    subject.add_to_order("curry")
    subject.add_to_order("chips")
    expect(subject.total_order).to eq(9)
  end

  end
