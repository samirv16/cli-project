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
    test1 = team_list.split("?").pop
    test2 = test1.split(/\d\./).drop(1)
    test3 = test2.shift(9)
    test4 = test2.pop
    test5 = test4.split("A")
    test6 = test5.shift
    test3 << test6
    # binding.pry
  end
     
     
  def self.scrape_tream_desc
    descs = []
    
    descs << @doc.css("#txtd_22027317 p").text #Arsenal (2004)
    descs << @doc.css("#txtd_22027320 p").text #Milan (1988–1994)
    descs << @doc.css("#txtd_22027326 p").text #Liverpool (1984)
    descs << @doc.css("#txtd_22027324 p").text #West Germany (1972–1974)
    descs << @doc.css("#txtd_22027322 p").text #France (1998–2000)
    descs << @doc.css("#txtd_22027328 p").text #Real Madrid (1955–1960)
    descs << @doc.css("#txtd_22027330 p").text #Manchester United (1999)
    descs << @doc.css("#txtd_22027332 p").text #Barcelona (2009)
    descs << @doc.css("#txtd_22027334 p").text #Brazil (1970)
    descs << @doc.css("#txtd_22027337 p").text #Spain
    
    
  end
  
  

end 