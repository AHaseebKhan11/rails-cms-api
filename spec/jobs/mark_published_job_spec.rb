require 'rails_helper'

RSpec.describe MarkPublishedJob, type: :job do
  let!(:content) { create(:content, :draft) }

  it 'should enqueue job on correct time and date' do
    ActiveJob::Base.queue_adapter = :test

    expect do
      MarkPublishedJob.set(wait_until: content.published_date).perform_later(content)
    end.to have_enqueued_job.with(content).at(content.published_date)

    expect(MarkPublishedJob).to have_been_enqueued.exactly(:once)
  end
end
