require 'Takeaway'
describe Takeaway do
  it 'responds to menu' do
    expect(subject).to respond_to(:menu)
  end
  it "access menu" do
    expect(subject.read_menu).to receive(:puts).with(:menu)
    #require_relative 'menu.rb'
  end
  it 'menu should have dishes to provide customer' do
    expect(subject.menu).not_to be_empty
  end
  it "allows to order" do
      subject.order("pizza")
      expect(subject.items).to eq({"pizza" => 1})
  end
  end
end