require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :firefox
end


After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d_%H-%m-%S")
    filename = "error-#{ @current_page.class }-#{ time }.png"
    @current_page.save_screenshot(filename)
    embed(filename, image/png)
  end
  @browser.close
end