require 'rails_helper'

RSpec.describe Content, type: :model do
  it 'has a valid factory' do
    expect(build(:content, :published)).to be_valid
    expect(build(:content, :draft)).to be_valid
  end

  let!(:draft_content) { create(:content, :draft) }
  let!(:published_content) { create(:content, :published) }

  describe 'Model validations' do
    it 'should raise invalid record error when summary is too long' do
      expect do
        FactoryBot.create(:content,
                          :draft,
                          summary: Faker::Lorem.paragraph_by_chars(100))
      end.to raise_error(ActiveRecord::RecordInvalid, /Summary is too long/)
    end

    it 'should raise Invalid record error when content is too long' do
      expect do
        FactoryBot.create(:content,
                          :draft,
                          content: Faker::Lorem.paragraph_by_chars(300))
      end.to raise_error(ActiveRecord::RecordInvalid, /Content is too long/)
    end

    it { expect(draft_content).to validate_presence_of(:summary) }
    it { expect(draft_content).to validate_presence_of(:content) }
    it { expect(draft_content).to validate_presence_of(:author) }
    it { expect(draft_content).to validate_presence_of(:published_date) }

    it 'should validate status enum' do
      should define_enum_for(:status).with(%i[draft published])
    end
  end

  describe 'Callbacks' do
    it { is_expected.to callback(:perform_status_check).after(:commit) }
    it { is_expected.to callback(:flush_cache).after(:commit) }
  end
end
