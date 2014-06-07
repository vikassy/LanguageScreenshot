require_relative '../../../../../mediawiki-ruby-api/lib/mediawiki_api/client.rb'

SUPPORTED_LANGUAGE={
  English: "en",
  German: "de",
  Hebrew: "he"
}

class LanguageScreenshotBot
  attr_accessor :api_client

  def initialize
    @api_client = MediawikiApi::Client.new((ENV["MEDIAWIKI_UPLOAD_API"] || "http://commons.wikimedia.org/w/api.php"))
    puts @api_client.inspect
    puts "Login with #{ENV["UPLOAD_USER"]},#{ENV["UPLOAD_PASSWORD"]}"
    @api_client.log_in(ENV["UPLOAD_USER"], ENV["UPLOAD_PASSWORD"])
  end

  def run_cucumber
    `bundle exec cucumber features/ --tags @language_screenshot`
  end

  def license(language, language_code, file_name)
    file_name.gsub(/_/," ")
    date = Date.today.to_s
    "=={{int:filedesc}}==
  {{Information
  |description={{#{language_code}|1=#{file_name}}}
  |date=#{date}
  |source=Automatically created by MediaWiki-Selenium-Screenshot-Creator
  |author=Automatically created by MediaWiki-Selenium-Screenshot-Creator
  |permission=
  |other_versions=
  |other_fields=
  }}

  =={{int:license-header}}==
  {{Wikipedia-screenshot}}

  [[Category:VisualEditor]]
  [[Category:#{language}]]"
  end

  def upload_all_images(language, language_code)
    puts "here!!"
    screenshot_directory = ENV["LANGUAGE_SCREENSHOT_PATH"] || "./screenshots/"
    	#Upload each image to wikimedia commmons
    Dir["./#{screenshot_directory}/*-#{language_code}.png"].each do |file_path|
    	# upload_image()
    	file_name = File.basename(file_path, "")
    	puts "Uploading #{file_name}"
    	puts @api_client.upload_image(file_name, file_path, license(language, language_code, file_name),true)
    end
  end

  def run
    SUPPORTED_LANGUAGE.each do |language,language_code|
      #Set Environment variable
      ENV["LANGUAGE_SCREENSHOT_CODE"]=language_code
      #Run Cucumber test 
      run_cucumber()
      #Upload images
      upload_all_images(language.to_s,language_code)
    end
  end
end
bot = LanguageScreenshotBot.new
bot.run