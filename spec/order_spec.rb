require 'order'

describe Order do

  it "should by default return an empty order" do
    expect(subject.return_order).to eq []
  end

end
