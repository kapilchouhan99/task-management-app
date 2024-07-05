require 'rails_helper'

RSpec.describe SendReminderJob, type: :job do
  let(:user) { create(:user, email: 'test@example.com') }
  let(:task) { create(:task, user: user, status: 'In_progress', deadline: '2024-12-31') }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe '#perform' do
    context 'when the task status is not Done' do
      it 'enqueues the job and sends a deadline reminder email' do
        expect {
        SendReminderJob.perform_now(task)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'when the task status is Done' do
      it 'does not enqueue the job and does not send a deadline reminder email' do
        task.update(status: 'Done')

        expect {
        SendReminderJob.perform_now(task)
        }.not_to change { ActionMailer::Base.deliveries.count }
      end
    end
  end
end
