require_relative '../lib/basket.rb'  # => true
require_relative '../lib/menu.rb'    # => true

describe Basket do                              # ~> NoMethodError: undefined method `describe' for main:Object
  let(:menu) { double(:menu, order:[naan,2]) }


  it "responds to the method 'view'" do
    expect(subject).to respond_to(:view)
  end

  # it "shows a list of items that have been ordered" do
  #   menu = Menu.new
  #   menu.order(:naan,2)
  #   expect(subject.view).to eq([:naan,0.99,2])
  # end



end

# ~> NoMethodError
# ~> undefined method `describe' for main:Object
# ~>
# ~> /Users/matt/Dropbox/Projects/takeaway-challenge/spec/basket_spec.rb:4:in `<main>'
