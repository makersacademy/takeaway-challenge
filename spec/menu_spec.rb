require 'menu'

describe Menu do
  it 'responds to #menu' do
    expect(subject).to respond_to(:menu)
  end
end