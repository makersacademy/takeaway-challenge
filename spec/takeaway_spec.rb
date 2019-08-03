require_relative '../lib/takeaway.rb'

describe Takeaway do
  let(:menu_list) {'Spaghetti: £4.50'}
  let(:menu) {double(:menu, show: menu_list)}
  subject {described_class.new(menu: menu)}
  it 'display list of the dishes with prices' do
    expect(subject.show_menu).to eq('Spaghetti: £4.50')
  end
end