require 'spec_helper'


describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    it "should have the title'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home")
    end
    it "should not have the title'Home'" do
      visit '/static_pages/home'
      expect(page).not_to have_title('Home')
    end
  end

  describe "Help page" do
    it "must include the content 'help'" do
      visit '/static_pages/help'
      expect(page).to have_content("help me")
    end
    it "should have the title'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end


  describe "About us" do
    it "should have the content 'about us'" do
      visit '/static_pages/about'
      expect(page).to have_content("about us")
    end
    it "should have the title'About us'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About us")
    end
  end
end
#
#describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end
