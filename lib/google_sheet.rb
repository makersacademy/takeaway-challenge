  # Go to https://console.cloud.google.com/apis/dashboard?pli=1
  # Create a new project (there is a dropdown near top left of screen)
  # When popup appears, try "new project", give it a name
  # Click search for api, select "googe sheets API" and enable it if not already enabled. 
  # Create credentials (should be obvious button top of page) when you're inside your project overview
  # Once you've created credentials, click on th ehyperlink to take you into your credential you set up
  # Click on KEYS, add key, create new key, select json and download
  # Add file to your project (root level)
  # re-name your JSON file and add that new name to .gitignore
  # Within the json file there is a client_email, you want to use that user in your google sheet when sharing the sheet. 
require "google_drive"

class Menu

  def initialize
    @creds = GoogleDrive::Session.from_service_account_key("google_creds.json")
    @dishes = {}
  end
  
  attr_reader :creds, :dishes


  def get_dishes
    get_current_sheet_contents.each { |row| 
      @dishes[row[0]] = {:name => "", :price =>""}
      @dishes[row[0]][:name] = row[1]
      @dishes[row[0]][:price] = row[2].to_i
    }
  
  end

  #  { "1"=> { :name => "Tomato Soup", :price => 5 }, "2" =>{ :name => "Avocado On Toast", :price => 7 }, "3" => { :name => "Spaghetti Bolognese", :price => 12 }, "4" => { :name => "Mushroom Surprise", :price => 9 }, "5" => { :name => "Pizza", :price => 10 }, "6" => { :name => "Ice Cream", :price => 4}, "7" =>{ :name => "Cake", :price => 4 }} 


  private

  def get_current_sheet_contents
    spreadsheet = @creds.spreadsheet_by_title("EdsDiner")
    sheet = spreadsheet.worksheets.first
    sheet.rows
  end

end



# require 'bundler'
# Bundler.require

# Authenticate a session with your Service Account
# session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
# spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")
# Get the first worksheet
# worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
# worksheet.rows.each { |row| puts row.first(6).join(" | ") }