class Milestone
  include Mongoid::Document
  
  #fields
    field :name,    type: String
    field :due_at,  type: DateTime
  
  #associations
    belongs_to :team
    embeds_many :tasks
  
  #tasks
    def open_tasks
      tasks.incomplete
    end
    
    def closed_tasks
      tasks.complete
    end
    
end