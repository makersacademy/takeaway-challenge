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
    menu = get_current_sheet_contents
    menu == [] ?  (raise "The Menu is empty") : menu.each { |row| 
      @dishes[row[0]] = {:name => "", :price =>""}
      @dishes[row[0]][:name] = row[1]
      @dishes[row[0]][:price] = row[2].to_i
    }
  
  end

  private

  def get_current_sheet_contents
    spreadsheet = @creds.spreadsheet_by_title("EdsDiner")
    sheet = spreadsheet.worksheets.first
    sheet.rows
  end

end

