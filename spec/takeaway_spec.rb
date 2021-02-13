require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:menuclass) { double(:menuclass, new: menu) }
  subject { Takeaway.new(menuclass) }

  it 'displays the menu' do
    expect(menu).to receive(:display)
    subject.show_menu
  end

end
