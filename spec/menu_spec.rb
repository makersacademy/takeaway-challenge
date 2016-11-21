require 'menu.rb'

describe Menu do

  let(:menu) { described_class.new }

  it "should return the menu when read method called" do
    expect(subject.read).to eq({:duck => 10, :beef => 20, :fish => 12})
  end


end
