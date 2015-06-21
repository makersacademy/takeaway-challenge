require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, content: {"Fish and chips" => 7, "Steak and chips" => 10,
                                       "Shepherd's Pie" => 5, "Bangers and mash" => 5} }
  subject { Takeaway.new menu }

  it 'can receive orders' do
    subject.order "Steak and chips"
    expect(subject.orders).to eq({"Steak and chips" => 10})
  end

  it 'gives a receipt' do
    subject.order "Fish and chips"
    subject.order "Shepherd's Pie"
    expect(subject.receipt).to eq 12
  end

end
