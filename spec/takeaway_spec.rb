require 'Takeaway'
describe Takeaway do
  it 'responds to menu' do
    expect(subject).to respond_to(:menu)
  end
  it "access menu" do
    expect(subject.read_menu).to receive(:puts).with(:menu)
    #require_relative 'menu.rb'
  end
end