class Content < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  validates :summary, :content, :author, :title, :published_date, presence: true

  # some basic validations for summary and content
  validates :summary, length: { maximum: 50 }
  validates :content, length: { maximum: 250 }

  after_commit :flush_cache
  after_commit :perform_status_check, on: :create

  def flush_cache
    Rails.cache.delete('contents')
  end

  def self.index_content_cached
    Rails.cache.fetch('contents') do
      ActiveModelSerializers::SerializableResource.new(Content.published, each_serializer: Contents::IndexSerializer).to_json
    end
  end

  def perform_status_check
    if published_date.utc <= Time.now.utc
      published!
    elsif draft?
      MarkPublishedJob.set(wait_until: published_date).perform_later(self)
    end
  end
end
