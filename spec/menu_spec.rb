require 'menu'

describe Menu do
  it 'creates a menu' do
    expect(described_class).to respond_to(:new)
  end
end
