# Note for gem developer/contributer
# Create file called 'dev_config.yml' in your project root with the following:
#
# service_key: "xxxxxxx"
# site_user_guid: "xxxxxxx"
# profile_guid: "xxxxxx"
#
# run 'bundle console'and then
# load 'dev.rb' to load this seed data

@config = YAML.load_file('dev_config.yml')
@service_key = @config["service_key"]
@site_user_guid = @config["site_user_guid"]
@profile_guid = @config["profile_guid"]
@access_hash = {  service_key: @service_key,
                  site_user_guid: @site_user_guid,
                  profile_guid: @profile_guid
                }

@entity_hash = {
  :customer_id => "1",
  :first_name => "Andrew",
  :last_name => "Smith",
  :account_number => "123456789",
  :email_address => "andrew@example.com"}
@service_hash = {
:content_service_id => "489"
}
@request = DecisionLogic::Request.new(@access_hash)

@response = @request.create_request4(@service_hash, @entity_hash)

puts "You have a @request and @response object to use"