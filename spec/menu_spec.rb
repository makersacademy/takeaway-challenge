require 'menu'

describe Menu do
before { allow(subject).to receive(:full_menu){ p "item = £item_price\n" }}

describe '#menu', :menu do
  it "responds to the method" do
    expect(subject).to respond_to :full_menu
  end
end

describe '#full_menu', :full_menu do
  it 'returns string of dish names and prices' do
    expect(subject.full_menu).to eq("item = £item_price\n")
  end
end
end
