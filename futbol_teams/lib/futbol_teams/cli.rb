require 'pry'

class CLI
  
  def run 
    
    greeting
    Scraper.scrape_team_names
    Loop do 
      user_input = menu
      if user_input == "exit"
        return
      else 
        self.list_teams
        self.choose_teams
      end
    end
  end   
  
  def greeting
    puts "\nWelcome, descriptions available for the following top 10 futbol teams of all time:\n"
  end
  
  def list_teams
    Team.all.each.with_index(1) do |team, i|
      puts "#{i}. #{team.name}\n"
    end
  end
  
  def input_valid?(input)
    input == input.to_i
    input > 0 && inputs < Team.all.length
  end
  
  
  
end