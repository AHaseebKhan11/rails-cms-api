class MarkPublishedJob < ApplicationJob
  queue_as :default

  def perform(content)
    content.published! if content.published_date.utc <= Time.now.utc
  end
end
