class Post < ApplicationRecord
  include AASM

  aasm column: :post_state do
    state :sleeping, initial: true
    state :active
    state :inactive # 退会

    event :inactive do
      transitions from: :active, to: :inactive
    end

    event :active do
      transitions from: [:sleeping, :inactive], to: :active
    end
  end
end
