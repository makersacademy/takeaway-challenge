require 'meal'

describe Meal do
  subject(:meal){ described_class.new }

  it {should respond_to(:select_dishes)}

  describe "#select_dishes" do
    
  end
end
