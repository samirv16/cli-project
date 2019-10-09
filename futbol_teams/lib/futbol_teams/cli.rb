require 'pry'

class CLI
  
  def run 
    self.greeting
    self.list_teams
    Scraper.scrape_team_names
    loop do 
      user_input = menu
      if (user_input == "exit" || user_input.include?("n")) #&& user_input.to_i <= 0 && user_input.to_i > Team.all.length
        return
      else
        # self.error
        self.list_teams
        self.choose_team
      end
    end
  end   
  
  def greeting
    puts "\nWelcome, descriptions available for the following top 10 futbol teams of all time:\n"
  end
  
  def menu
   puts "\nWould you like to see the team list?\n"
   input = gets.strip.downcase
   return input 
  end
  
  
  def list_teams
    Team.all.each.with_index(1) do |team|
      puts "\n #{team.name}\n"
    end
  end
  
  def choose_team
    puts "\nWhat team do you want to learn more about?\n"
      index = gets.strip.to_i - 1
      team = Team.all[index]
      self.description(team)
  end
  
  def description(team)
    puts team.description
  end
  
  def input_valid?(input)
    input == input.to_i
    input > 0 && inputs < Team.all.length
  end
  
  def error 
    puts "\nThats not an option, please try again:\n"
  end 
  
  def goodbye
    puts "\nBye Felicia!\n"
  end
  
  
end