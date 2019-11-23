require 'menu'

describe Menu do

  let(:subject) { Menu.new("kimchi", 5, true) }

  it "should have a dishes" do
    expect(subject).to respond_to(:dish)
  end
  
  it "should have prices" do
    expect(subject).to respond_to(:price)
  end

  it "should have available dishes" do
    expect(subject.available?).to eq true
  end

end
