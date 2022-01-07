require 'order'

describe Order do

  it { should respond_to(:add_dish).with(1).argument }

  it { should respond_to(:remove_dish).with(1).argument }

  it "should initialize with an empty order" do
    expect(subject.order).to be_empty
  end

end