require 'texter'

describe Texter do
  it 'has a send command' do
    expect(subject).to respond_to(:send)
  end
end