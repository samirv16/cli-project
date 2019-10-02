class FutbolTeams::CLI
  
  def call
    puts "Choose futbol team to see headlines for:"
    list_teams
  end
  
  def list_teams
    puts <<-DOC.gsub /^\s*/, ""
      1. Real Madrid CF
      2. FC Barcelona 
      3. Manchester United
      4. Chelsea FC
      5. Bayern Munich
      6. Arsenal FC 
      7. PSG
      8. Juventus
      9. Liverpool FC
      10. Manchester City
      DOC
  end
  
end