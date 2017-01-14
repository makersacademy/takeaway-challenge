require 'order'

describe Order do

  it 'should respond to the method check' do
    expect(subject).to respond_to(:check)
  end

  it 'should return the number of items in order when calling method check' do
    expect { subject.check }.to eq(2)
  end

end
