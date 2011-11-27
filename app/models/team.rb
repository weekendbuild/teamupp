class Team
  include Mongoid::Document
  
  #fields
    field :name, type: String

  #associations
    has_and_belongs_to_many :users, inverse_of: :teams
    has_many :milestones

  #attributes
    def usernames
      users.map(&:username).join(',')
    end

    def usernames=(username_string)
      names = username_string.split(',')
      self.user_ids = names.map { |name| User.find_or_create_by(username: name).id }
    end
    
  #tasks
    def closed_tasks
      []
    end
  
end
