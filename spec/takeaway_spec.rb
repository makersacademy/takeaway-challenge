require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, content: {"Fish and chips" => 7, "Steak and chips" => 10,
                                       "Shepherd's Pie" => 5, "Bangers and mash" => 5} }
  subject { Takeaway.new menu }

  it 'can receive orders as [dishes], [quantity], expected total' do
    subject.order ["Steak and chips", "Fish and chips"],[2, 1], 27
    expect(subject.preparing).to eq([["Steak and chips", 2], ["Fish and chips", 1]])
  end

  it 'gives a bill' do
    expect(subject.bill_comes_to [["Steak and chips", 2], ["Fish and chips", 1]]).to eq 27
  end

  it 'will raise an error if the expected total does not equal the actual total' do
    expect { subject.order ["Steak and chips", "Fish and chips"],[2, 1], 26 }.to raise_error "Not totalling to expected"

  end

end
