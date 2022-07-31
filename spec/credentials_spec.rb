require_relative '../lib/credentials'

describe Credentials do

  it "has an auth token" do
    allow(ENV).to receive(:[]).and_return("auth test")
    credentials = described_class.new
    expect(credentials.auth_token).to eq "auth test"
  end

  it "has an account id" do
    allow(ENV).to receive(:[]).and_return("account test")
    credentials = described_class.new
    expect(credentials.auth_token).to eq "account test"
  end
end
