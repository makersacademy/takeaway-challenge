require "./lib/email_conf"

describe Email_conf do

  subject(:email) { described_class.new }

  it "should send email confirmations" do

    expect(email.respond_to?(:send_text)).to eq true

  end

end
