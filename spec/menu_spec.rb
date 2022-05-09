require 'menu.rb'

describe Menu do
  it 'shows menu items' do
    expect(subject).to respond_to(:read)
  end
end
