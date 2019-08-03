require_relative '../lib/takeaway.rb'

describe Takeaway do
  subject {described_class.new}
  it 'display list of the dishes with prices' do
    expect(subject.show_menu).to eq('Spaghetti: £ 4.50')
  end
end