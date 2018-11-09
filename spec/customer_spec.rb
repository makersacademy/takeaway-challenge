require "customer"

describe Customer do
  let(:customer) {Customer.new("Michael Slevin")}
  it { expect(customer.phone_number).to eq("07889151641") }
  it { expect(customer.name).to eq "Michael Slevin" }
end
