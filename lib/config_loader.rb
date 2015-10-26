class ConfigLoader
  def initialize(config_file)
    @config =  YAML.load(File.open(config_file, 'r'))
  end
  def account_sid
    fail "Account SID Missing" unless @config.key?('Account SID')
    @config['Account SID']
  end
  def auth_token
    fail "Auth Token Missing" unless  @config.key?('Auth Token')
    @config['Auth Token']
  end
  def config
    @config.dup
  end
end
