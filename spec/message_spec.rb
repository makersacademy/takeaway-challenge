require 'message'

describe Message do
  it "should initialize with an account_sid" do
    expect(subject.account_sid).to eq "AC0c335080db1f411ec0a91201a29743f1"
  end

  it "should initialize with an auth_token" do
    expect(subject.auth_token).to eq "8f8e39564e1782d57d6eb144caa8f174"
  end
end
