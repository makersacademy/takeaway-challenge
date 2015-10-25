require 'config_loader'

describe ConfigLoader do
  let(:config_file) {'./support/config.yaml'}
  subject(:config_loader) {described_class.new(config_file)}

  context 'Loading Configuration' do
    it {is_expected.to respond_to(:config)}
    it {is_expected.to respond_to(:account_sid)}
    it {is_expected.to respond_to(:auth_token)}

    it 'raises an error if configuration file not found' do
      expect {described_class.new("non existant")}.to raise_error Errno::ENOENT
    end

    it 'raises an error if the Account SID is not in the config' do
      config_loader = described_class.new("./support/missing.yaml")
      expect {config_loader.account_sid}.to raise_error "Account SID Missing"
    end
    it 'raises an error if the Auth Token is not in the config' do
      config_loader = described_class.new("./support/missing.yaml")
      expect {config_loader.auth_token}.to raise_error "Auth Token Missing"
    end

    it 'Loads the Account SID' do
      expect(config_loader.account_sid).not_to be_empty
    end

    it 'loads the Auth Token' do
      expect(config_loader.auth_token).not_to be_empty
    end
  end
end
