require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  it 'initializes menu instance' do
    expect(menu).to be_instance_of Menu
  end

  it 'responds to contents' do
    expect(menu).to respond_to(:contents)
  end

  it 'initializes with MEALS by default' do
    expect(menu.contents).to include("chicken curry" => 12)
  end

  it 'responds to view_menu' do
    expect(menu).to respond_to(:view_menu)
  end

  describe '#view_menu' do
    it 'returns a list of dishes and their prices' do
      expect(menu.view_menu).to include(menu.contents)
    end
  end
end
