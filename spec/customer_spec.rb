
require 'customer'

describe Customer do

  it{ is_expected.to respond_to :check}

  #why does the test below work?

  it 'view menu list' do 
    menu = double :menu
    expect(subject.check menu).to eq menu
  end

end