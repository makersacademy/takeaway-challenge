require 'text'

describe Text do

  it 'initialize raises error when missing a number' do
    expect{described_class.new()}.to raise_error(ArgumentError)
  end
end
