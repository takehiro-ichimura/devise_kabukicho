class Dm < ApplicationRecord
    validates :content, {presence: true}
    belongs_to :user
    belongs_to :receive_user, class_name: 'User'
    def talking_user(me)
        if self.user == me
            return self.receive_user
        else
            return self.user
        end
    end
end