require 'coveralls'  
Coveralls.wear!

# couldn't get to work, error: Nokogiri was built against LibXML version 2.9.3, but has dynamically loaded 2.9.2  T
# tried to fix with 'bundle exec gem pristine nokogiri' but just wiped out nokogiri.  http://codebeerstartups.com/2013/07/warning-nokogiri-was-built-against-libxml-version-2-9-0-but-has-dynamically-loaded-2-7-8/ 
# Already had significant probs loading nokogiri in first place, so have rund all code without coveralls
require 'capybara/rspec'


