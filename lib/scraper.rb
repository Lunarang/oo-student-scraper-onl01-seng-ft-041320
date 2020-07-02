require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    
    students = []
    
    doc.css("roster-cards-container").each do |student|
      
    student_name = student.css("student-name").text #name
    student_location = student.css("student-location").text #location
    url = student.css("a")["href"] #profile_url

    students << {name: student_name, location: student_location, profile_url: url}
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    
  end

end
