class User
  include Mongoid::Document
  # include OmniAuth::Identity::Models::Mongoid

  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  attr_accessible :provider, :uid, :name

  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	  end
	end
end