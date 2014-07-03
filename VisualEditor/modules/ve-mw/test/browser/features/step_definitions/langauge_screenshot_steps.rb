Given(/^I go to the (.+) page$/) do |page_name|
  step "I am on the #{page_name} page"
  @browser.goto "#{@browser.url}&uselang=#{ENV['LANGUAGE_SCREENSHOT_CODE']}"
end

Given(/^I am editing a random page$/) do
  step "I am at a random page"
  @browser.goto "#{@browser.url}?vehidebetadialog=true&veaction=edit"
  step "I click in the editable part"
end

Given(/^I am edit a random page with (.+)$/) do |content|
  step "I am editing a random page"
  step "I edit the page with #{content}"
end

When(/^I click on the Insert menu$/) do
  on(VisualEditorPage).insert_menu_element.when_present.click
end

When(/^I click on the Special character option in Insert menu$/) do
  step "I click on the Insert menu"
  on(VisualEditorPage).special_character_element.when_present.click
end

When (/^I click on list and indentation dropdown$/) do
  on(VisualEditorPage).bullet_number_selector_element.when_present.click
end

Then(/^I should see Headings pull-down menu$/) do
  on(VisualEditorPage).heading_dropdown_menus_element.when_present.should be_visible
  step "I take screenshot of pull-dowm menu"
end

Then(/^I take screenshot of pull-dowm menu$/) do
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.downarrow_element, @current_page.heading_dropdown_menus_element])
end

Then(/^I should see Formatting pull-down menu$/) do
  on(VisualEditorPage).formatting_option_menus_element.when_present.should be_visible
  step "I take screenshot of Formatting pull-down menu"
end

Then(/^I take screenshot of Formatting pull-down menu$/) do
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.ve_text_style_element,@current_page.formatting_option_menus_element])
end

Then(/^I should see pull-down menu containing Page Settings$/) do
  on(VisualEditorPage).page_settings_element.when_present.should be_visible
  step "I take screenshot of Visual Editor insert menu"
end

Then(/^I take screenshot of Visual Editor insert menu$/) do
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.tools_menu_element, @current_page.page_option_menu_element])
end

Then(/^I should see Insert pull-down menu$/) do
  on(VisualEditorPage).insert_pull_down_element.when_present.should be_visible
  step "I take screenshot of insert pull-down menu"
end

Then(/^I take screenshot of insert pull-down menu$/) do
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.insert_menu_element, @current_page.insert_pull_down_element])
end

Then(/^I should see Special character Insertion window$/) do
  on(VisualEditorPage).iframe_element.when_present.should be_visible
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.iframe_element])
end

Then(/^I should see save changes dialog box$/) do
  on(VisualEditorPage).iframe_element.when_present.should be_visible
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.iframe_element])
end

When(/^I click on Page settings option$/) do
  on(VisualEditorPage).page_settings_element.when_present.click
end

Then(/^I should see Page settings dialog box$/) do
  on(VisualEditorPage).iframe_element.when_present.should be_visible

  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.iframe_element])

  capture_screenshot("VisualEditor_Page_Settings_Redirects-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.page_settings_heading_element, @current_page.prevent_redirect_element], @current_page.iframe_element, 0)

  capture_screenshot("VisualEditor_Page_Settings_TOC-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.table_of_contents_element], @current_page.iframe_element, 0)

  capture_screenshot("VisualEditor_Page_Settings_Edit_Links-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.page_settings_editlinks_element], @current_page.iframe_element, 0)

  capture_screenshot("VisualEditor_Apply_changes-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.apply_changes_element], @current_page.iframe_element, 0)
end

Then(/^I should see list and indentation dropdown$/) do
  on(VisualEditorPage).indentation_pull_down_element.when_present.should be_visible
  capture_screenshot("#{@scenario.name}-#{ENV['LANGUAGE_SCREENSHOT_CODE']}.png", [@current_page.indentation_pull_down_element, @current_page.bullet_number_selector_element], nil, 3)
end