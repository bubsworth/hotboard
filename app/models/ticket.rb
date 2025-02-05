class Ticket < ApplicationRecord
  broadcasts_refreshes
  validates_presence_of :title, :description

  enum :state, %i[backlog next in_progress done], default: :backlog

  after_update_commit -> { broadcast_refresh_later_to("main-board") }
  after_create_commit -> { broadcast_refresh_later_to("main-board") }
  after_destroy_commit -> { broadcast_refresh_later_to("main-board") }
end
