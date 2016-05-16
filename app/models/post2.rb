class Post2 < ActiveRecord::Base
    has_many :comment2s
    validates :content, presence: { message: "내용이 비었습니다!"}
end
