at_exit do
  $browser.close unless ENV["KEEP_BROWSER_OPEN"] == "true"
end

#This is for the multiedit test
Before("@edit_user_page_login") do
  if (!$edit_user_page_login or !(ENV["REUSE_BROWSER"] == "true")) and @browser
    step "I am logged in"
    step "I am at my user page"
    step "I edit the page with Editing with"
    $edit_user_page_login=true
  end
end

def capture_screenshot(file_name, path)
  min_x = min_y = 99999
  max_x = max_y = 0
  screenshot_elements(file_name).each do |ve_element|
    html_element = @current_page.method(ve_element).call.element
    location_x = html_element.wd.location.x
    location_y = html_element.wd.location.y
    width = html_element.wd.size.width
    height = html_element.wd.size.height
    min_x = location_x if location_x < min_x
    min_y = location_y if location_y < min_y
    max_x = location_x+width if location_x+width > max_x
    max_y = location_y+height if location_y+height > max_y
  end
  crop_image(path, max_x, min_x, max_y, min_y)
end

def crop_image(path, max_x, min_x, max_y, min_y)
  require "chunky_png"
  element = ChunkyPNG::Image.from_file(path)
  element.crop!(min_x,min_y,max_x-min_x,max_y-min_y)
  element.save(path)
end

def screenshot_elements(scenario)
  screenshot_elements_hash = {
    "VisualEditor_Headings:_Check_presence_of_all_headings_values" => ["heading_menus_element","heading_dropdown_menus_element"],
    "VisualEditor_general_text_markup_features:_Presence_of_Formatting_Menus" => ["ve_text_style_element","formatting_option_menus_element"]
  }
  screenshot_elements_hash.fetch(scenario)
end

After("@language_screenshot") do |scenario|
  if @browser && @current_page && (ENV["LANGUAGE_SCREENSHOT"] == "true")
    require "fileutils"
    screenshot_directory = ENV["LANGUAGE_SCREENSHOT_PATH"] || "screenshots"
    FileUtils.mkdir_p screenshot_directory
    file_name = test_name(scenario).gsub(/ /, '_')
    path = "#{screenshot_directory}/#{file_name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png"
    @browser.screenshot.save path
    embed path, "image/png"
    capture_screenshot(file_name,path)
  end
end

