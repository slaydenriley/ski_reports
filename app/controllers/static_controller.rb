class StaticController < ApplicationController
  def home
    @reports = Report.all
  end

  def update
    Report.destroy_all

    snowbowl_data = Scraper.scrape_snowbowl_page
    Report.create(snowbowl_data)


    discovery_data = Scraper.scrape_discovery_page
    Report.create(discovery_data)

  end
end
