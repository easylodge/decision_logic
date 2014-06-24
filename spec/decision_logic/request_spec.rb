require 'spec_helper'


describe DecisionLogic::Request do

  describe "with no access hash" do 
    it "it raises error" do 
      expect{DecisionLogic::Request.new}.to raise_error(ArgumentError)
    end

  end

  describe "with access hash and invalid details" do
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

    describe ".hello_world" do 
      it "returns 'Hello World'" do 
        expect(@request.hello_world).to eq('Hello World')
      end
    end

    describe ".search_banks_by_bank_name" do 
      it "returns nil" do 
        expect(@request.search_banks_by_bank_name('woolworths')).to eq(nil)
      end
    end

    describe "dev_config.yml" do
      it "should exist" do 
        expect{File.read('dev_config.yml')}.to_not raise_error
      end

      it "is included in the gitignore file" do
        expect(File.read('.gitignore')).to include('dev_config.yml')
      end
    end
  end

  describe "with developer decision_logic config file" do
    before do 
      config = YAML.load_file('dev_config.yml')
      service_key = config["service_key"]
      site_user_guid = config["site_user_guid"]
      profile_guid = config["profile_guid"]
      @entity_hash = {
        :customer_id => "1",
        :first_name => "Andrew",
        :last_name => "Smith",
        :account_number => "123456789",
        :email_address => "andrew@example.com"}
      @service_hash = {
      :content_service_id => "489"
      }
      @request = DecisionLogic::Request.new(
          { service_key: service_key,
            site_user_guid: site_user_guid,
            profile_guid: profile_guid
          }
        )
      


    end

    describe "dev_config.yml" do
      it "should exist" do 
        expect{File.read('dev_config.yml')}.to_not raise_error
      end

      it "is included in the gitignore file" do
        expect(File.read('.gitignore')).to include('dev_config.yml')
      end
    end
    
    describe ".service_key" do
      it "returns service_key value" do
        expect(@request.service_key).to_not eq(nil)
      end
    end 

    describe ".site_user_guid" do
      it "returns site_user_guid" do
        expect(@request.site_user_guid).to_not eq(nil)
      end
    end

    describe ".profile_guid" do 
      it "returns profile_guid" do
        expect(@request.profile_guid).to_not eq(nil)
      end
    end
      
  end


  

end