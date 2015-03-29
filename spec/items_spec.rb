require 'items'

describe Items do
  let(:items) { described_class.new } # Rubocop makes me use this.
  it 'contains the menu items' do
    expect(items.list).to be_a(Hash)
  end
  it 'is not empty' do
    expect(items.list.count).not_to be 0
  end
end
