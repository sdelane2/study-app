class Course < ApplicationRecord
    
    validates :title, :short_description, :language, :price, :level, presence: true
    validates :description, presence: true, length: { :minimum => 5 }

    def to_s
        title
    end
    
    has_rich_text :description
    belongs_to :user

    extend FriendlyId
    friendly_id :title, use: :slugged

    LANGUAGES = [:"English", :"French", :"German", :"Spanish"]
    def self.languages
      LANGUAGES.map { |language| [language] }
    end
  
    LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
    def self.levels
      LEVELS.map { |level| [level] }
    end

    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }

end
