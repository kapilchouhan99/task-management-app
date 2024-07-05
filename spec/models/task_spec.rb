require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:deadline) }
  end

  describe 'enums' do
    it 'should define the status enum correctly' do
      expect(task).to define_enum_for(:status).with_values({ Backlog: 0, In_progress: 1, Done: 2 })
    end
  end
end
