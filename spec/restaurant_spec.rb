require 'restaurant'

RSpec.describe Restaurant do

  let(:menu) { double(:menu) }

  it 'should respond to .order' do
    expect(subject).to respond_to(:order)
  end

  it 'should show the menu' do
    expect(subject.view_menu).to be_a Hash
  end
end
