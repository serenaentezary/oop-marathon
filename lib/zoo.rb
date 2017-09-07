require "pry"

class Zoo
  attr_reader :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = Array.new(10) {Cage.new}
    @employees = []
  end

  def add_employee(name_of_employee)
    @employees << name_of_employee
  end

  def open?(date)
    #(@season_opening_date..@season_closing_date).include?(date)
    date.between?(@season_opening_date, @season_closing_date)
  end

  def add_animal(animal)
    @cages.select{ |cage| cage.empty? }.first.animal = animal
    # @cages.each do |cage|
      # if cage.empty?
      #   cage.animal = animal
      #   break
      # end
    # end
  end

  def visit
    phrases = ""
    @employees.each do |employee|
      phrases += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if cage.empty? == false
        phrases += "#{cage.animal.speak}\n"
      end
    end
    phrases
  end
end
