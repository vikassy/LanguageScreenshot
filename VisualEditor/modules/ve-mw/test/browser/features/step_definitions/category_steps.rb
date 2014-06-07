When(/^I click on Page Option$/) do
  on(VisualEditorPage).tools_menu_element.when_present.click
end

Then(/^I should see Category option$/) do
  on(VisualEditorPage).page_option_menus_element.when_present.should be_visible
end
