require 'order'

describe Order do

  it 'should respond to the method check' do
    expect(subject).to respond_to(:check)
  end

end
