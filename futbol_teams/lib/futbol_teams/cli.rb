require 'pry'

class CLI
  
  def run 
    greeting
    Scraper.scrape_team_names
    loop do 
      user_input = menu
      if user_input == "exit" || user_input.include?("n")
        return
      else 
        list_teams
        choose_team
      end
    end
  end   
  
  def greeting
    puts "\nWelcome, descriptions available for the following top 10 futbol teams of all time:\n"
  end
  
  def menu
   puts "\nenter number for which team youd like to see a description, type 'list' to see teams again, or type exit:\n"
   input = gets.strip.downcase
   return input 
  end
  
  
  def list_teams
    Team.all.each.with_index(1) do |team, i|
      puts "\n#{i}. #{team.name}\n"
    end
  end
  
  def choose_team
    puts "\nWhat team do you want to learn more about\n"
      index = gets.strip.to_i - 1
      team = Team.all[index]
      self.description(team)
  end
  
  def description(team)
    puts team.description
  end
  
  # def input_valid?(input)
  #   input == input.to_i
  #   input > 0 && inputs < Team.all.length
  # end
  
  # def goodbye
  #   puts "\nBye Felicia!\n"
  # end
  
  
end