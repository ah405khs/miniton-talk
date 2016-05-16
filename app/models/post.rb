class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    
    validates :content, presence: { message: "내용이 비었습니다!"} 
end
