require 'menu'

describe Menu do

  it 'has a list of dishes' do
    expect(subject).to respond_to(:dishes)
  end


end