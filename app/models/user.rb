class User
  include Mongoid::Document

  #fields
    field :provider, :type => String
    field :uid, :type => String
    field :name, :type => String
    field :username, :type => String
    attr_accessible :provider, :uid, :name, :username
  
  #associations
    has_and_belongs_to_many :teams, inverse_of: :users
  
  #omniauth
    def setup_omniauth(auth)
      update_attributes(
        uid: auth.uid,
        name: auth.info.name,
        provider: auth.provider
      )
    end

    def registered?
      uid.present? || provider.present?
    end
  
end