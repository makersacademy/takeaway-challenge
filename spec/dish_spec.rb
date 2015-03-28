require 'dish'

describe Dish do
  it 'takes an options hash on initialization' do
    expect { described_class.new(options: 'hash') }.not_to raise_error
  end
end