require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Question create", :type => :feature do
  scenario "User creates a new question" do
    visit "/questions/new"

    fill_in "Question", :with => "Will Quipper hire Ruth?"
    fill_in "Answer", :with => "Yes!!!"

    click_button "Create Question"

    expect(page).to have_text("Question created successfully")
  end
end