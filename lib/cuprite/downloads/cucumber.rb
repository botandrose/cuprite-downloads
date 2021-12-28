require "cuprite/downloads"
require "capybara/cuprite/driver"

Capybara::Cuprite::Driver.class_eval do
  def downloads
    @downloads ||= Capybara::Cuprite::Downloads.new
  end
end

Capybara.save_path = Capybara::Cuprite::Downloads.pathname

Before do
  if downloads = page.driver.try(:downloads)
    downloads.reset
  end
end

