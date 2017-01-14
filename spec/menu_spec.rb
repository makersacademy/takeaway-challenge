require 'menu'


describe Menu do
  subject(:menu) { described_class.new }
  let(:menu) { double :menu, starter: {"seaweed" => 1.20} }

it { is_expected.to respond_to :starter}

  # it "returns a list of food and prices" do
  #   #allow(menu).to receive(starter).and_return({"seaweed" => 1.20})
  #   expect(menu.starter(menu)).to eq(menu.starter)
  # end


end
