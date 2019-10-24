require 'menu'

describe Menu do
  
  it 'has an empty list of dishes' do
    expect(subject.dishes).to eq []
  end
end
