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

  protected

    def post(service, message)
      client = Savon.client(wsdl: "http://www.decisionlogic.com/integration.asmx?wsdl")
      client.call(service, message: message)
    end

end