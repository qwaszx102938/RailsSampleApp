class Micropost < ActiveRecord::Base
    belongs_to :user
    default_scope -> {order('created_at DESC')}
    validates :user_id,presence:true,length: {maximum: 140}
    validates :content, presence: true

end
