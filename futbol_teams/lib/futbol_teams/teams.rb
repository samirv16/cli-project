require 'pry'
require 'nokogiri'
require 'open-uri'

class FutbolTeams::Teams
    
    
    @doc = Nokogiri::HTML(open("https://howtheyplay.com/team-sports/Top-10-Best-Football-Teams-Of-All-Time"))
  
  def self.all
    #should return a bunch of teams
    self.scrape_team_names
  end
      
  
  def self.scrape_team_names
    
    team_list = @doc.css(".full.module.moduleText .subtitle").text
    team_list1 = team_list.split("?").pop
    team_list2 = team_list1.split(/\d\./).drop(1)
    final_team_list = team_list2.shift(9)
    team_list4 = team_list2.pop
    team_list5 = team_list4.split("A")
    team_list6 = team_list5.shift
    final_team_list << team_list6
    final_team_list.reverse
    # binding.pry
  end
     
     
  def self.scrape_tream_desc
    descs = []
    
    descs << @doc.css("#txtd_22027337 p").text #Spain
    descs << @doc.css("#txtd_22027334 p").text #Brazil (1970)
    descs << @doc.css("#txtd_22027332 p").text #Barcelona (2009)
    descs << @doc.css("#txtd_22027330 p").text #Manchester United (1999)
    descs << @doc.css("#txtd_22027328 p").text #Real Madrid (1955–1960)
    descs << @doc.css("#txtd_22027322 p").text #France (1998–2000)
    descs << @doc.css("#txtd_22027324 p").text #West Germany (1972–1974)
    descs << @doc.css("#txtd_22027326 p").text #Liverpool (1984)
    descs << @doc.css("#txtd_22027320 p").text #Milan (1988–1994)
    descs << @doc.css("#txtd_22027317 p").text #Arsenal (2004)
    
    
  end
  
  

end 