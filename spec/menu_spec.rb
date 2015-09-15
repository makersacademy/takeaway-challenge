require 'menu'

describe Menu do

  let(:extended_class) { Class.new { extend Menu } }

  it "knows a price of each dish" do
    price = extended_class.price('pizza')
    expect(price).to eq(12.99)
  end

end
