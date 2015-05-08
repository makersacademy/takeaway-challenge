require 'menu'

describe Menu do

  let(:menu) { described_class }

  it 'menu is a hash' do
    expect(subject.menu).to be_a Hash
  end

  it 'hash menu include a dish name with price' do
    expect(subject.menu).to include("1" => {
                                      "dish" => "Roasted pork", "price" => "8"
                                    }
                                   )
  end
end
