require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb' #enables Scraper to make new courses and give them attributes scraped from the web page.

class Scraper
  
  def get_page # instance method that uses Nokogiri and open-uri to get the HTML from a web page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
    # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    # end
  end 
  
  def get_courses # uses a CSS selector to return an array of Nokogiri XML elements representing the courses described on the web page we are scraping
    self.get_page.css(".post")
  end 
  
  def make_courses # iterates over the courses array returned by method get_courses and creates a new Course instance (instantiating) out of each array element
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end
  
  
  def print_courses # calls on .make_courses and then iterates over all of the courses that get created to puts out a list of course offering
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
end

Scraper.new.get_page
Scraper.new.print_courses


