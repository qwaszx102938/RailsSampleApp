require 'spec_helper'


describe "Static pages" do

  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }


  subject { page }
  shared_examples_for "all static pages" do
    it { should have_content(heading)}
    it { should have_title(full_title(page_title))}
  end

  describe "Home page" do


    before do
      visit root_path
    end
    let(:heading){'Sample App'}
    let(:page_title){''}
    it_should_behave_like "all static pages"
    #it { should have_content('Sample App') }
    #it { should have_title(full_title("")) }

    it { should_not have_title('| Home') }
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
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
      expect(page).to have_selector('h1', text: "Contact")
    end
    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title(full_title("Contact"))
    end

  end

  it "should have right links on the  layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title("About us"))
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
