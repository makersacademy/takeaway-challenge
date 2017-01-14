require './lib/menu'
require './lib/menuhash'

describe Menu do
  it "prints full rows of dishes with prices" do

    expect(subject.display_menu).to respond_to
  end

end
