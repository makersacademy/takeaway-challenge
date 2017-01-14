require 'menu'


describe Menu do
  subject(:menu) { described_class.new }
  let(:menu) { double :menu, starter: {"seaweed" => 1.20} }

it { is_expected.to respond_to :starter}



end
