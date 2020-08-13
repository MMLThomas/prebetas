class Project < ApplicationRecord
    belongs_to :user
    # belongs_to :category 
    has_many :comments, dependent: :delete_all
    has_many :enrollments, dependent: :delete_all
    has_many :backers, through: :enrollments, source: :user, dependent: :delete_all
    has_one_attached :image
    validates :duration, presence: {message: 'can’t be left blank'}
    validates :title, presence:  {message: 'can’t be left blank'}
    validates :title, uniqueness: {message: 'already taken'} 
    validates :story, presence: {message: 'can’t be left blank'}
    validates :start_date, presence: {message: 'can’t be left blank'}
    validates :incentive, presence: {message: 'can’t be left blank'}



    def self.recent
        self.limit(6)
    end

    def status
        self.end_date > Date.today ? "Active" : "Completed"
    end

    def end_date
        self.start_date.to_date + self.duration
    end

    def backers
        User.find(self.backer_ids)
    end

    def self.search(params)
        self.where("title LIKE ?", "%#{params[:search]}%")
    end
    
    def backing_project?(user)
        self.backers.find(user) ? true : false
    end


    def show_comments
        if !self.comments.empty?
            self.comments
        else 
            []
        end
    end

end
