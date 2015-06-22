require 'menu'

describe Menu do
  it 'contains a list of dishes and prices' do
    expect(subject.dishes).to eq ({:Noodles=>3.0, :Rice=>2.5})
  end
end