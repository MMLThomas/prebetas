class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :delete_all
    has_many :backers, through: :projects
    has_many :comments, dependent: :delete_all
    has_many :categories, through: :projects   
    has_many :enrollments, dependent: :delete_all   
    has_many :backed_projects, through: :enrollments, source: :project
    has_one_attached :image

    def backed_projects
        if self.enrollments.empty?
            "none"
        else
            self.backed_project_ids.map{|id| Project.find(id)}
        end
    end
    
end
