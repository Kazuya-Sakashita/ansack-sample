class Post < ApplicationRecord
  
  include AASM

  aasm column: :post_state do
    state :active, initial: true
    state :inactive # 退会

    event :inactive do
      transitions from: :active, to: :inactive
    end

    event :active do
      transitions from: :inactive, to: :active
    end
  end
end