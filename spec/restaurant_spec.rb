require 'restaurant'

describe Restaurant do
  subject(:resto) { described_class.new }

  it 'contain a menu' do
    expect(resto.menu).not_to eq (nil)
  end
end
