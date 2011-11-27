class Task
  include Mongoid::Document
  
  #fields
    field :description,   type: String
    field :completed_at,  type: DateTime,   default: nil
  
  #associations
    embedded_in :milestones, :inverse_of => :tasks
    belongs_to :completer, class_name: 'User'
  
  #methods
    def complete!(user)
      update_attributes(completed_at: DateTime.now, completer_id: user.id)
    end
    
    def uncomplete!
      update_attributes(completed_at: nil, completer_id: nil)
    end
    
    def completed?
      completed_at.present?
    end
  
  #scopes
    scope :incomplete, where(completed_at: nil)
    scope :complete, excludes(completed_at: nil)
  
end
