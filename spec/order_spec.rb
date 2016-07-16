require 'order'

describe Order do

  let(:order) { {"Satay" => 1, "Cendol" => 2 } }


  it 'can select dishes and return the total number selected' do
    expect(subject.select(order)).to eq 3
  end

end
