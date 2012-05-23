require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => 'Home')
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => 'Sign Up')
  end
  
  it "should have a signin page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => 'Sign In')
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign Up"
    response.should have_selector("title", :content => "Sign Up")
  end
  
  describe "when not signed in" do
     
     it "should have a signin link" do
         visit root_path
         response.should have_selector("a", :href => signin_path, :content => "Sign In")
     end
      
  end
  
  describe "when signed in" do
    
    before(:each) do
        @user = Factory(:user) 
        visit signin_path
        fill_in :email,     :with => @user.email
        fill_in :password,  :with => @user.password
        click_button
    end
  
    it "should have a sign out link" do
        visit root_path
        response.should have_selector("a", :href => signout_path, :content => "Sign Out")
    end
    
    it "should have a profile link" do
        visit root_path 
        response.should have_selector("a", :href => user_path(@user), :content => "Profile")     
    end
    
      
  end

end
