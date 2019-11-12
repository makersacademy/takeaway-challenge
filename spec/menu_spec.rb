require 'menu'

describe Menu do

  it 'has a list of dishes and prices' do
    expect(subject).to respond_to(:dishes)
  end

  it 'displays a list of dishes and prices' do
    expect(subject.print).to eq(@dishes)
  end
end
