require 'order'
require "menu"
describe Order do
  it "has an instance of Menu class as an instance variable" do
    expect(subject.instance_variable_get(:@menu)).to be_an_instance_of(Menu)
  end

end