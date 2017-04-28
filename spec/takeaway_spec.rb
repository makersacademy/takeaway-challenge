require 'takeaway'
require 'order'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { double(:order) }
  
  it 'displays a list of dishes with prices' do
    expect(subject.see_menu).to eq(Takeaway::MENU)
  end
end
