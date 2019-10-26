require 'menu'

describe Menu do
  let(:subject) { described_class.new }

  it 'should show a list of items with prices' do
    expect(subject.show_menu).to eq subject.dishes
  end

end
