class Post < ApplicationRecord
  include AASM

  aasm column: :post_state do
    state :sleeping, initial: true, timestamp: true
    state :active, timestamp: true
    state :inactive, timestamp: true # 退会

    before_all_events :log_event_start
    after_all_events :log_event_end

    event :sleeping do
      transitions from: nil , to: :sleeping
    end

    event :inactive do
      transitions from: :active, to: :inactive
    end

    event :active do
      transitions from: [:sleeping, :inactive], to: :active
    end
  end

  def log_event_start
    puts "before_all_events changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end

  def log_event_end
    puts "after_all_events changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end
