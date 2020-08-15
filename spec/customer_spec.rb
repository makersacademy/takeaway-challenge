require "customer"

describe Customer do 

  it { expect(subject).to respond_to(:order) }

end
