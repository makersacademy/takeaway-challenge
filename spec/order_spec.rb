require 'order'

describe Order do
  it "should be able to create and isntatnce of Menu" do
    expect(Order).to respond_to(:new)
  end

  it 'should respond to add_item with one argument' do
    allow(subject).to respond_to(:add_item).with(1).argument
  end
end
