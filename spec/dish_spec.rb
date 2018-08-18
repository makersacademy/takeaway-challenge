require 'dish'

describe Dish do
  it 'creates a new dish' do
    expect(described_class).to respond_to(:new)
  end
end
