require 'takeaway'

describe Takeaway do
  it 'returns a list of dishes and prices' do
    expect(subject.list_dishes).to be_a(Hash)
  end

  it 'selects a number of dishes' do
    subject.choose("fish", "chips")
    expect(subject.order).to eq(["fish","chips"])
  end

  it 'calculates total of order' do 
    subject.choose("fish", "chips")
    expect(subject.total).to eq(600)
  end

end
