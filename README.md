# Decision Logic

Ruby gem to make requests to Decision Logic service. Website: [https://www.decisionlogic.com](https://www.decisionlogic.com/)

## Installation

Add this line to your application's Gemfile:

    gem 'decision_logic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install decision_logic    


## Usage

    request = DecisionLogic.new(access_hash)

    access_hash = {
        :service_key => "xxxxxxxxxxxx",
        :site_user_guid => "xxxxxxxxxxxx",
        :profile_guid => "xxxxxxxxxx"})
    }

    request.service_key - Returns service_key value
    request.site_user_guid - Returns site_user_guid value
    request.profile_guid - Returns profile_guid value

    request.hello_world - Test to see if you can connect to the service. Should return "Hello World"

    request.search_banks_by_bank_name(bank_name) - Search for bank name. Returns hash with:
        :content_service_id
        :content_service_display_name
        :home_url
        :reliablility

    request.create_request4(service_hash, entity_hash)

    Takes two input hashes:
        service_hash = 
            :routing_number
            :content_service_id

        entity_hash =
                :customer_id
                :first_name
                :last_name
                :account_number
                :routing_number
                :content_service_id
                :email_address

    Returns either an error message or a 6 character string request code.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/decision_logic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Copy lib/config/dev_config.yml to project root and populate with your account details (in project root this file is excluded from repo by .gitignore)
4. Mark sure specs run green (that it is picking up your dev_config)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
