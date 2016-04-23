require 'menu'
describe Menu do

  it 'includes a list of dishes and prices'do
    expect(subject.list).to eq ({})
  end

  it 'accepts items added to the list' do
    expect(subject.add("Muna chicken", 3)).to eq ({"Muna chicken" => 3})
  end

  

end
