require 'takeaway'

RSpec.describe Takeaway do

  let(:menu) { double :menu, display_menu: [] }
  subject { described_class.new(:menu) }

  describe 'read_menu method' do
    it 'returns the menu' do
      allow(menu).to receive(:display_menu).and_return([])
      subject.read_menu
    end
  end

  it { is_expected.to respond_to(:read_menu) }

  it 'displays the menu' do
    expect(subject.read_menu).to eq(:menu)
  end

  # it 'returns a list of dishes and prices' do
  #   expect(subject.display_menu :menu).to be_an_instance_of(Array)
  # end

  # use double to simulate instance of envisaged Menu class

   # context Menu
end
