require 'customer'

describe Customer do
  subject(:customer){described_class.new(name: "customer", mobile: "mob ile")}
  it{is_expected.to respond_to(:name, :mobile)}

  describe '#new' do
    it {expect(customer.name).to eq("customer")}
    it {expect(customer.mobile).to eq("mobile")}
  end
end
