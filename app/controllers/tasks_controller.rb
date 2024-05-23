class TasksController < ApplicationController
    # Action to create a new task
    def create
      @task = Task.new(task_params)  # Initialize a new task with the provided parameters
  
      if @task.save  # If the task is successfully saved to the database
        redirect_to todo_path(@task.todo_id)  # Redirect to the todo's show page
      else
        redirect_to root_path  # If saving fails, redirect to the root path
      end
    end
  
    # Action to update an existing task
    def update
      @task = Task.find(params[:id])  # Find the task by its ID
  
      if @task.update(task_params)  # If the task is successfully updated with the provided parameters
        redirect_to todo_path(@task.todo_id)  # Redirect to the todo's show page
      else
        redirect_to root_path  # If updating fails, redirect to the root path
      end
    end
  
    private
  
    # Strong parameters to whitelist allowed task attributes
    def task_params
      params.require(:task).permit(:title, :done, :todo_id)
    end
  end
  