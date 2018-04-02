require 'menu'

describe Menu do

  it 'should be able to print a menu' do
    expect(subject).to respond_to(:read)
  end

end
