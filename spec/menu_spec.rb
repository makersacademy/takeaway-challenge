require_relative '../lib/menu'

RSpec.describe Menu do
  subject { described_class.new }

  it 'shows menu list' do
    menu = described_class::MENU
    expect(subject.show_menu).to eq menu
  end
  

end
