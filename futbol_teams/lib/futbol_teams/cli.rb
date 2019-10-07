require 'pry'

class FutbolTeams::CLI
  
  def call
    puts "descriptions available for the following top 10 futbol teams of all time:"
    list_teams
    menu
    bye
  end
  
  def list_teams
    # puts "10 most popular futbol teams:"
      @teams = FutbolTeams::Teams.all
      @teams.each.with_index(1) do |team, i|
       puts "#{i}. #{team}"
       puts ""
      end
  end
  
  def menu
    input = nil
    while input != "exit"
    first_msg = "enter number for which team youd like to see a description for, type 'list' to see teams again, or type exit:"
    puts first_msg
      input = gets.strip.downcase
      
      @description = FutbolTeams::Teams.scrape_tream_desc
      
      if input.to_i > 0 
        the_team = @description[input.to_i-1]
        puts the_team
        puts ""
      elsif input == "list"
        list_teams
        puts ""
        elsif input == "exit"
          puts ""
      else
        puts "That's not an option, please type 'list' to see teams again, or try again:"
        puts ""
      end
    end 
  end 
  
  def bye
    puts "Bye Felicia!"
  end 
  
end