require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new }
  let(:menu) { double :menu }
  let(:juices) { double :juices }

  it 'displays the menu' do
    allow(menu).to receive(:show_menu) { juices }
    expect(cafe.display(menu)).to eq juices
  end

end
