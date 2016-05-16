class Comment2 < ActiveRecord::Base
    belongs_to :post2
    validates :content, presence: { message: "내용이 비었습니다!"}
end
