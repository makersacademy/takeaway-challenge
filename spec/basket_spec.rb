require 'basket'
describe Basket do
  it "contains the current order" do
    expect(subject.instance_variable_get(:@current_order)).to be_an_instance_of(Array)
  end
  
end