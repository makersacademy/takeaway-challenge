# Setup

#### App

1. Install Ruby (version 2.6.5 or above)
2. Clone this depository
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`


#### Environment Variables

1. Open ~/.zshrc or ~/.profile depend on your Mac OS version

2. Append in the file:
    export TWILIO_ACCOUNT_SID="ACCOUNT SID"
    export TWILIO_AUTH_TOKEN="AUTH TOKEN"
    export TWILIO_NUMBER="PHONE NUMBER"
    export USER_MOBILE="Verified Caller"
  *Replace contents within the quotes with your Twilio account details, Twilio mobile number and your own mobile number*
  *Make sure USER_MOBILE is shortlisted as verified caller in Twilio*

3. run source ~/.zshrc or source ~/.profile