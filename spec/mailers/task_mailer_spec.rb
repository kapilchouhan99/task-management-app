require 'rails_helper'

RSpec.describe TaskMailer, type: :mailer do
  describe 'deadline_reminder' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:task) { create(:task, user: user, title: 'Test Task', deadline: '2024-12-31') }
    let(:mail) { TaskMailer.deadline_reminder(task) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Task Deadline Reminder')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['notifications@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Reminder')
      expect(mail.body.encoded).to match('Your task "Test Task" is due soon.')
      expect(mail.body.encoded).to match('Deadline: 2024-12-31')
    end
  end
end
