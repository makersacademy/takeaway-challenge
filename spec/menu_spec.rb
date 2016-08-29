require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:key) {double :key}
  let(:value) {double :value}

  it 'list should contain item and price' do
    expect(menu.list).to_not be_nil
  end
  it 'should display list' do
    expect{menu.show_list}.to output.to_stdout
  end
end
