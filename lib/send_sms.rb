require 'twilio-ruby'

class Texter

  $account_sid = 'ACbe75dd4194edff887150bbf67882dea0'
  $auth_token = '05cce90c2c7942e599c0f32fd1b5186f'

  $client = Twilio::REST::Client.new($account_sid, $auth_token)

  def send_text(message)
    $client.messages.create(
        from: '+441274271485',
        to: '+447896084705',
        body: "#{message}"
    )
  end
end
