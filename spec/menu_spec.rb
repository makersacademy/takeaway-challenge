require_relative '../lib/menu'

describe Menu do

  it 'Check that a customer can see a list of options on the menu' do
    expect(subject).to respond_to(:view)
  end

end