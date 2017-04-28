require 'order'

describe 'Order' do
  subject = Order.new

  it "starts with an empty list" do
    expect(subject.customer_order).to eq []
  end

  before do
    IO.any_instance.stub(:puts)
    $stdin = StringIO.new("a\n")
    subject.select_item
  end

  after do
    $stdin = STDIN
  end

  it "selects of an item called 'test'" do
    expect(subject.selection).to eq "a"
  end

  before do
    IO.any_instance.stub(:puts)
    $stdin = StringIO.new("5\n")
    subject.select_item_quantity
  end

  after do
    $stdin = STDIN
  end

  it "selects a quantity of 5" do
    expect(subject.quantity).to eq 5
  end

  it "clears current choices" do
    subject.clear_current_choices
    expect(subject.selection).to eq nil
    expect(subject.quantity).to eq nil
  end

end
