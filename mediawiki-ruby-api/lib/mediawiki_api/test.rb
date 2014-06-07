require_relative 'client.rb'
client = MediawikiApi::Client.new "http://commons.wikimedia.org/w/api.php"

client.log_in ENV["COMMONS_USERNAME"],ENV["COMMONS_PASSWORD"]

ENV["LANGUAGE_SCREENSHOT"]=true
ENV["LANGUAGE_SCREENSHOT_URL"]="http://www."

example_comment="=={{int:filedesc}}==\n{{Information\n|description={{en|1=Screenshot of VisualEditor; Heading's Menu}}\n|date=#{date}\n|source=Automatically created by MediaWiki-Selenium-Screenshot-Creator\n|author=Automatically created by MediaWiki-Selenium-Screenshot-Creator\n|permission=\n|other_versions=\n|other_fields=\n}}\n\n=={{int:license-header}}==\n{{Wikipedia-screenshot}}\n\n[[Category:VisualEditor]]"
puts client.upload_image "VisualEditorHeading-de.png","../heading-de.png",example_comment
