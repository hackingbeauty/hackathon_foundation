require 'spec_helper'

describe Authentication do
  
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :uid => '123456789',
      :provider => 'facebook'
    }
  end
  
  it "should create a new instance given valid attributes" do
    Authentication.create!(@attr)
  end
  
  describe "user assocations" do
    
    before(:each) do
      @authentication = @user.authentications.create(@attr)
    end
    
  end

end
