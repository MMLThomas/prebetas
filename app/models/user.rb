class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :delete_all
    has_many :backers, through: :projects
    has_many :comments, dependent: :delete_all
    has_many :categories, through: :projects   
    has_many :enrollments, dependent: :delete_all   
    has_many :backed_projects, through: :enrollments, source: :project
    has_one_attached :image
    validates :first_name, :presence => {message: 'can’t be left blank'}
    validates :last_name, :presence => { message: 'cant be left blank'}
    validates :username, :presence => {message: 'cant be left blank'}
    validates :username, :uniqueness => {message: 'already taken'}
    validates :email, :presence => {message: 'cant be left blank'}
    validates :email, :uniqueness => { message: 'account with this email already exist'}
    
    

    def backed_projects
         self.backed_project_ids.map{|id| Project.find(id)}
    end


    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.first_name = response[:info][:first_name]
            u.last_name = response[:info][:last_name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
    
end
