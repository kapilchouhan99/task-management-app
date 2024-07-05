require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
        post :create, params: { task: { title: 'New Task', description: 'Task description', deadline: '2024-12-31' } }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { task: { title: 'New Task', description: 'Task description', deadline: '2024-12-31' } }
        expect(response).to redirect_to(Task.last)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates the requested task" do
        patch :update, params: { id: task.id, task: { title: 'Updated Task' } }
        task.reload
        expect(task.title).to eq('Updated Task')
        end

      it "redirects to the task" do
        patch :update, params: { id: task.id, task: { title: 'Updated Task' } }
        expect(response).to redirect_to(task)
      end
    end
  end

  describe "PATCH #update_status" do
    it "updates the status of the task" do
      patch :update_status, params: { id: task.id, status: 'In_progress' }, xhr: true
      task.reload
      expect(task.status).to eq('In_progress')
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task
      expect {
      delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_url)
    end
  end
end
