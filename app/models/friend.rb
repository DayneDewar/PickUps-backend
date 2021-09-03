class Friend < ApplicationRecord
    validates_uniqueness_of :added_user_id, scope: :user_id
end
