require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  BASE_URL = "https://howtheyplay.com/team-sports/Top-10-Best-Football-Teams-Of-All-Time"

  def self.scrape_team_names
    doc = Nokogiri::HTML(open(BASE_URL))
    
    @team_info = doc.css("#hub_resp_main .full.module.moduleText")[1..10]
    @team_info.collect do |element| 
      
        name = element.css("h2").text
        url = BASE_URL
        Team.new(name, url)
    end
  end
  
  # def self.scrape_description
  #   doc = Nokogiri::HTML(open(BASE_URL))
    
  #   @team_info.collect do |element| 
      
  #     team.description = element.css("p").text
      
  #   end
  # end
  binding.pry

end