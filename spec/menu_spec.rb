require 'menu'

describe Menu do

  #let(:menu) {double(:menu, item: "burger", price: 2)}
  #let(:subject) {described_class.new(menu)}

  it 'returns the menu' do
    expect(subject.display_menu["coke"]).to eq "0.60"
  end


end
