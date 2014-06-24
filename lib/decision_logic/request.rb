class DecisionLogic::Request

  attr_accessor :service_key, :site_user_guid, :profile_guid
  
  def initialize(access_hash)
    @service_key = access_hash[:service_key]
    @site_user_guid = access_hash[:site_user_guid]
    @profile_guid = access_hash[:profile_guid]
  end

end