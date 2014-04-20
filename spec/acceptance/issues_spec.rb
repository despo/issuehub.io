require_relative '../spec_helper'

describe "viewing the homepage", :type => :feature do
  it "shows the page" do
    visit "/"

    expect(page).to have_content("issuehub")
  end
end