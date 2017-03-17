class Listing < ApplicationRecord
  after_save ThinkingSphinx::RealTime.callback_for(:listing)
end
