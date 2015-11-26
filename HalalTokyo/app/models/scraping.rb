require 'mechanize'

def scraping_image(link)
  agent = Mechanize.new
  page = agent.get(link)
  image_url = page.at