require 'menu'

describe Menu do

  it 'should return a the price of a pizza' do
    expect(subject.menu["Marinara"]).to eq 5.95
    expect(subject.menu["Capagnola"]).to eq 9.95
  end


end
