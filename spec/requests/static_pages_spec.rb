require 'spec_helper'


describe "Static pages" do

  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }
  describe "Home page" do

    before do
      visit root_path
    end
    it { should have_content('Sample App') }
    it { should have_title(full_title("")) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before {
      visit help_path
    }
    it "must include the content 'help'" do
      expect(page).to have_content("help me")
    end
    it "should have the title'Help'" do
      expect(page).to have_title(full_title("Help"))
    end
  end


  describe "About us" do
    before {
      visit about_path
    }
    it "should have the content 'about us'" do
      expect(page).to have_content("about us")
    end
    it "should have the title'About us'" do
      expect(page).to have_title(full_title("About us"))
    end
  end
  describe "Contract" do

    it "should have the content 'contact'" do
      visit contact_path
      expect(page).to have_content("Contact")
    end
    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title(full_title("Contact"))
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
