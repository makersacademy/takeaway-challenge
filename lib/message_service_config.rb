class MessageServiceConfig
  attr_reader :account_sid, :auth_token, :from, :to

  def initialize(account_sid, auth_token, from, to)
    @account_sid = account_sid
    @auth_token = auth_token
    @from = from
    @to = to
  end
end
