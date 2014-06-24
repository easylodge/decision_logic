require 'spec_helper'


describe DecisionLogic::Request do

  describe "with no access hash" do 
    it "it raises error" do 
      expect{DecisionLogic::Request.new}.to raise_error(ArgumentError)
    end

  end

  describe "with access hash" do
  before do 
    @request = DecisionLogic::Request.new(
        { service_key: 'my_service_key',
          site_user_guid: 'my_site_user_guid',
          profile_guid: 'my_profile_guid'
        }
      )
  end 
    it "creates instance" do 
      expect(@request.class).to eq(DecisionLogic::Request)
    end

    describe ".service_key" do 
      it "returns service_key value" do 
        expect(@request.service_key).to eq('my_service_key')
      end
    end

    describe ".site_user_guid" do 
      it "returns site_user_guid value" do 
        expect(@request.site_user_guid).to eq('my_site_user_guid')
      end
    end

    describe ".profile_guid" do 
      it "returns profile_guid value" do 
        expect(@request.profile_guid).to eq('my_profile_guid')
      end
    end
  end

end