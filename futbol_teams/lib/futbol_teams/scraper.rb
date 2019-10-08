require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  BASE_URL = "https://howtheyplay.com/team-sports/Top-10-Best-Football-Teams-Of-All-Time"

  def self.scrape_team_names
    doc = Nokogiri::HTML(open(BASE_URL))
    
    team_info = doc.css("#hub_resp_main .full.module.moduleText")[1..10]
    team_info.collect do |element| 
      
        name = element.css("h2").text
        Team.new(name)
    end
  binding.pry
  end
  
  # def self.scrape_site
  #   doc = Nokogiri::HTML(open("https://howtheyplay.com/team-sports/Top-10-Best-Football-Teams-Of-All-Time"))
    
  #   team_info = doc.css("#hub_resp_main .full.module.moduleText")[1..10]
  #   team_info.collect do |element| 
      
  #     description: element.css("p").text
  #   end
  # end

end