require 'menu'

describe Menu do

  it "should have a list of dishes" do
    expect { (subject.items).to_not be_empty }
  end
end
