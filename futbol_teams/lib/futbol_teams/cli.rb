require 'pry'
require 'colorize'


class CLI
  
  def run 
    greeting
    Scraper.scrape_team_info
    list_msg
    call
  end   
  
  def call
    loop do 
      user_input = menu
      if user_input == "exit" || user_input.include?("n") 
      goodbye
        return
      else
        list_teams
        choose_team
      end
    end
  end
  
  
  def greeting
    puts "\nWelcome, descriptions available for the following top 10 futbol teams of all time:\n".colorize(:ligh_blue)
  end
  
  def list_msg
    puts "\nWould you like to see the team list?\n".colorize(:light_blue)
  end
  
  def menu
   input = gets.strip.downcase
   return input 
  end
  
  
  def list_teams
    Team.all.each.with_index(1) do |team|
      puts "\n #{team.name}\n".colorize(:color => :white, :background => :red)
    end
  end
  
  def choose_team
    puts "\nWhat team do you want to learn more about?\n".colorize(:light_blue)
      index = gets.strip.to_i - 1
      team = Team.all[index]
      if input_valid?(index)
      self.description(team)
      puts "\nType 'list' to see list again, or type 'exit'\n".colorize(:light_blue)
       elsif index == "list"
       list_teams
       elsif index == "exit"
       goodbye
       return
       elsif !input_valid?(index)
       error
       list_teams
       choose_team
     end
  end
  
  def description(team)
    puts team.description.colorize(:blue)
  end
  
  def input_valid?(input)
    input == input.to_i
    input >= 0 && input <= Team.all.length
  end
  
  def error 
    puts "\nThats not an option, please try again:\n".colorize(:red)
  end 
  
  def goodbye
    puts "\nBye Felicia!\n".colorize(:red)
  end
  
  
end
