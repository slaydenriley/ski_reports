require 'net/http'
class Scraper < ApplicationRecord
  def self.scrape_snowbowl_page
    data = []
    report = Nokogiri::HTML(Net::HTTP.get(URI("https://www.montanasnowbowl.com/report.php")))
    date = report.css("tr")[1].children.children[4].text
    base = report.css("tr")[3].children[5].text.split("\n        ").last.to_i
    top = report.css("tr")[4].children[5].text.split("\n        ").last.to_i
    name = "Montana Snowbowl"

    data << {name: name, date: date, top: top, base: base}
  end

  def self.scrape_discovery_page
    data = []
    report = Nokogiri::HTML(Net::HTTP.get(URI("https://www.skidiscovery.com/")))
    date = Date.today
    base = report.css("div.figures")[0].text.to_i
    top = nil
    name = "Discovery Ski Area"

    data << {name: name, date: date, top: top, base: base}
  end

  def self.all
    @@all
  end
end
