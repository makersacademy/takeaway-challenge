require 'menu'

describe Menu do
  it 'displays dishes and prices' do
    menu = described_class.new # Rubocop for some reason didn't like me using Menu.new?
    expect(menu.respond_to?(:dishes)).to be true
  end
end
