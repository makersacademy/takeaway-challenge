require 'mail'

class EmailClient

  def initialize
    @client = Mail.defaults do
      delivery_method :smtp, address: ENV['GM_SMTP'],
       port: ENV['GM_PORT'],
       user_name: ENV['GM_UN'],
       password: ENV['GM_PW'],
       authentication: ENV['GM_AUTH'],
       enable_starttls_auto: true
    end
  end

  def notify(body)
    mail = Mail.new do
      to ENV['DUMMY_EMAIL']
      from ENV['GM_UN']
      subject "#{ENV['REST_NAME']} - Thank you for ordering!"
      body body
    end
    mail.deliver!
  end

end
