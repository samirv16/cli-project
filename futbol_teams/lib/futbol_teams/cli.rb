require 'pry'

class CLI
  
  def run 
    
    greeting
    Scraper.scrape_team_names
  end   
  
  def greeting
    puts "\ndescriptions available for the following top 10 futbol teams of all time:\n"
  end
  
  
end