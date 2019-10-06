require 'pry'
require 'nokogiri'
require 'open-uri'

class FutbolTeams::Teams
    attr_accessor :name, :description, :scores, :url
    
    @doc = Nokogiri::HTML(open("https://howtheyplay.com/team-sports/Top-10-Best-Football-Teams-Of-All-Time"))
  
  def self.all
    #should return a bunch of teams
    self.scrape_team_names
  end
      
      
  # def self.scrape_teams
    # @descriptions = []
    # @descriptions << self.scrape_tream1_desc
     
    # @descriptions
    
      # team_1 =  self.new 
      # team_1.name = "Real Madrid CF"
      # team_1.headlines = [
      #   "- Van de Beek: 'I will finish out the whole season with Ajax, Real Madrid know that'", 
      #   "- Real Madrid's Champions League fate is in Falcao's hands", 
      #   "- Dortmund CEO says they’ll try to keep Achraf Hakimi next summer", 
      #   "- Luis Fernandez: Areola can be a success at Real Madrid", 
      #   "- Antic: Barcelona aren't dominating, and Real Madrid and Atletico are performing below expectation"]
      # team_1.scores = ["Sevilla 0:1 Real Madrid", "Real Madrid 2:0 Osasuna"]
      # team_1.url = "https://www.fotmob.com/teams/8633/"
      
      # team_2 =  self.new 
      # team_2.name = "FC Barcelona"
      # team_2.headlines = [
      # "- Valverde praises Messi impact in Barcelona Victory",
      # "- Barcelona 2-1 Inter Milan, Champions League: Match Review",
      # "- Messi 'obviously' has no problem with Griezmann",
      # "- Conte blasts referee for lack of 'respect' towards inter players in Barca defeat",
      # "- Twitter Reacts as Luis Suarez Inspires Barcelona Comeback Against Well-Drilled Inter"] 
      # team_2.scores = ["Getafe 0:2 Barcelona", "Barcelona 2:1 Inter"]
      # team_2.url = "https://www.fotmob.com/teams/8634/"
      
      # team_3 =  self.new 
      # team_3.name = "Manchester United"
      # team_3.headlines = [
      # "- Jose Mourinho's next move could have an influence on Manchester United's future",
      # "- Ole Gunnar Solskjær not risking Paul Pogba because of 'worst' pitch",
      # "- Scouting report: How Manchester United target Sean Longstaff is faring",
      # "- Pogba needs a bit of a rest - solskjaer not willing to risk midfielder for az clash",
      # "- 7 British Clubs' Worst European Nights of the 21st Century"]
      # team_3.scores = ["West Ham 2:0 Manchester United", "Manchester United 6:4 Rochdale"]
      # team_3.url = "https://www.fotmob.com/teams/10260/"
      
      # team_4 =  self.new 
      # team_4.name = "Chelsea FC"
      # team_4.headlines = [
      # "- Abraham birthday goal for Chelsea a timely nudge for England boss Southgate",
      # "- Lampard braced for Ajax battle as Chelsea see off Lille",
      # "- Lille 1-2 Chelsea: Report, Ratings & Reaction as Blues Claim Massive Win in France",
      # "- Willian's bouncer vaults Chelsea past Lille after Abraham's birthday goal",
      # "- Lille 1-2 Chelsea: William grabs winner in landmark win for blues"]
      # team_4.scores = ["Chelsea 2:0 Brighton & Hove Albion", "Lille 1:2 Chelsea"]
      # team_4.url = "https://www.fotmob.com/teams/8455/"
       
      
      # team_5 =  self.new 
      # team_5.name = "Bayern Munich"
      # team_5.headlines = [
      # "- Injury update: Bayern Munich's David Alaba and Jerome Boateng are undergoing treatment",
      # "- 'It had nothing to do with it': Kimmich unfazed by goal against Tottenham",
      # "- UEFA Champions League Matchday 2: Discussion and Live Thread",
      # "- New Bayern Munich signings, ratings and cards in FIFA 20!",
      # "- Bayern Munich Have Proven They're the Team to Beat in the UEFA Champions League This Season"]
      # team_5.scores = ["Bayern Munich 3:0 FK Crvena Zvezda", "Bayern Munich 4:0 FC Koln"]
      # team_5.url = "https://www.fotmob.com/teams/9823/"
      
      # team_6 =  self.new 
      # team_6.name = "Arsenal FC"
      # team_6.headlines = [
      # "- Borussia Dortmund CEO has bizarre dig at Pierre-Emerick Aubameyang",
      # "- Serge Gnabry says Mesut Özil the best he’s played with",
      # "- Unai Emery explains why Kieran Tierney didn’t play against Manchester United: Adds that he’s set to feature vs Standard Liege",
      # "- Pierre-Emerick Aubameyang is Arsenal’s PotM for September",
      # "- Report: Arsenal really did bid €60m for Upamecano – Leipzig trying to remove €80m release clause"]
      # team_6.scores = ["Arsenal 5:0 Nottingham Forest", "Manchester United 1:1 Arsenal"]
      # team_6.url = "https://www.fotmob.com/teams/9825/"
      
      # team_7 =  self.new 
      # team_7.name = "PSG"
      # team_7.headlines = [
      # "- Report: PSG Interested in Signing Félix if Neymar and Mbappé Leave the Club",
      # "- Video: A Fan’s View of Galatasaray’s Infamous Stadium Atmosphere",
      # "- Neymar “Feels Like a Different Person at Times” According to PSG Source",
      # "- PSG Show Mental Toughness In Win Over Galatasaray",
      # "- REACTIONS : GALATASARAY vs PARIS SAINT-GERMAIN"]
      # team_7.scores = ["Lyon 0:1 PSG", "PSG 0:2 Reims"]
      # team_7.url = "https://www.fotmob.com/teams/9847/"
      
      # team_8 =  self.new 
      # team_8.name = "Juventus"
      # team_8.headlines = [
      # "- Referee Damir Skomina was criticised by Antonio Conte for the level of respect given to Inter's players in their 2-1 loss at Barcelona.",
      # "- Manu’s Grab Bag: Lockdown",
      # "- Maurizio Sarri Hoping to Be Reunited With N'Golo Kante as Juve Suspect Chelsea May Sell",
      # "- The 9 Footballers Who Earn the Most Per Instagram Post",
      # "- Cristiano Ronaldo Smashes Champions League Record During Juventus' Win Over Bayer Leverkusen"]
      # team_8.scores = ["Brescia 1:2 Juventus", "Juventus 2:0 SPAL"]
      # team_8.url = "https://www.fotmob.com/teams/9885/"
      
      # team_9 =  self.new 
      # team_9.name = "Liverpool FC"
      # team_9.headlines = [
      # "- Salzburg gave Liverpool a major scare – but that might be exactly what they needed",
      # "- Klopp tips Vardy to run riot against Liverpool after defending agains Salzburg",
      # "- Liverpool 4-3 Salzburg | Story of the Match & Goal Reactions",
      # "- So, how exactly did Red Bull Salzburg nearly achieve a Champions League miracle against Liverpool?",
      # "- 'We Fell Apart, But We Won!' | Liverpool 4-3 RB Salzburg | Fan Reaction"]
      # team_9.scores = ["Chelsea 1:2 Liverpool", "Milton Keynes Dons 0:2 Liverpool"]
      # team_9.url = "https://www.fotmob.com/teams/8650/" 
      
      # team_10 =  self.new 
      # team_10.name = "Manchester City"
      # team_10.headlines = [
      # "- FIFA 20: Magical Mahrez headlines FUT team of the week",
      # "- SHOOTING DRILLS AT TRAINING | Man City Training",
      # "- 7 British Clubs' Worst European Nights of the 21st Century",
      # "- Bayern Munich Ready Fresh Leroy Sane Approach After Rejecting Gabriel Jesus Move",
      # "- Pep Guardiola Provides Update on Kevin De Bruyne Injury Following Dinamo Zagreb Win"]
      # team_10.scores = ["Preston North End 0:3 Manchester City", "Everton 1:3 Manchester City"]
      # team_10.url = "https://www.fotmob.com/teams/8456/"
      
      # [team_1, team_2, team_3, team_4, team_5, team_6, team_7, team_8, team_9, team_10]
      
      # teams
  # end
  
  def self.scrape_team_names
    
    team_list = @doc.css(".full.module.moduleText .subtitle").text
    test1 = team_list.split("?").pop
    test2 = test1.split(/\d\./).drop(1)
    test3 = test2.shift(9)
    test4 = test2.pop
    test5 = test4.split("A")
    test6 = test5.shift
    test3 << test6
  end
     
     
  def self.scrape_tream_desc
    descs = []
    
    descs << @doc.css("#txtd_22027337 p").text
    
    descs << @doc.css("#txtd_22027334 p").text
    # desc3 = @doc.css("#txtd_22027332 p").text
    # binding.pry
    
  end
  
  

end 