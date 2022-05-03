require 'confirmation'

describe Confirmation do

  subject(:confirmation) { Confirmation.new }

  it "should create an instance of class Confirmation" do
    expect(confirmation).to be_instance_of(Confirmation)
  end

end
