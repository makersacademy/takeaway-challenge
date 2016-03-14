require 'dotenv'

Dotenv.load

def hello
  puts "Yes it does!" if (ENV['S3_BUCKET'] == "YOURS3BUCKET")

end
