class DecisionLogic::Request

  attr_accessor :service_key, :site_user_guid, :profile_guid

  def initialize(access_hash)
    @service_key = access_hash[:service_key]
    @site_user_guid = access_hash[:site_user_guid]
    @profile_guid = access_hash[:profile_guid]
  end

  def hello_world
    response = self.post(:hello_world, nil)
    if response.success?
      response.body[:hello_world_response][:hello_world_result]
    else
      response
    end
  end

  def search_banks_by_bank_name(bank_name)
    message = { 
      serviceKey: self.service_key, 
      bankName: bank_name
    }

    response = self.post(:search_banks_by_bank_name, message)
    if response.success?
      response.to_hash[:search_banks_by_bank_name_response][:search_banks_by_bank_name_result]
    else
      response
    end
  end

  def create_request4(service_hash, entity_hash)
    message = {
      :serviceKey => self.service_key,
      :siteUserGuid => self.site_user_guid,
      :profileGuid => self.profile_guid,
      :customerId => entity_hash[:customer_id],
      :firstName => entity_hash[:first_name],
      :lastName => entity_hash[:last_name],
      :accountNumber => entity_hash[:account_number],
      :routingNumber => service_hash[:routing_number],
      :contentServiceId => service_hash[:content_service_id],
      :emailAddress => entity_hash[:email_address]
      }

    response = self.post(:create_request4, message)
    if response.success?
      response.to_hash[:create_request4_response][:create_request4_result]
    else
      response
    end
  end

  protected

    def post(service, message)
      client = Savon.client(wsdl: "http://www.decisionlogic.com/integration.asmx?wsdl")
      client.call(service, message: message)
    end

end