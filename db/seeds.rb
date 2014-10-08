# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Rant.destroy_all

user = User.create({ first_name: 'Rantly', last_name: 'Test', username: 'test', password: 'password', bio: 'test', rant_frequency: 'Daily' })
user1 =  User.create({ first_name: 'Brandly', last_name: 'Testing', username: 'test1', password: 'password', bio: 'test', rant_frequency: 'Weekly' })
user2 =  User.create({ first_name: 'Chantly', last_name: 'Test', username: 'test2', password: 'password', bio: 'test', rant_frequency: 'Monthly' })

Rant.create([
  { user_id: "#{user.id}", category: 'Civic hacking', rant: 'So, what we wanted to do was to empower advocacy groups that represent tenants, especially low-income tenants, and to empower the housing department to make sure that people are obeying the law and to do so more efficiently. So, we created these temperature sensors that mesh network. So, you can have many of them in a building and they all can communicate with each other instead of all connecting directly to the internet. And only one of them needs an internet connection. And you can do that over 3G or Wi-Fi. And they send a signal to our Rails app. And it analyzes the readings and determines whether or not there’s a violation and produces a lot of pretty charts and graphs and things that advocacy groups and attorneys and inspectors could print out and use as evidence in mediating cases.'},
  { user_id: "#{user.id}", category: 'CSS', rant: 'Another one that I really liked is if you’ve listened to me on the podcast before then you know my lovely issues with CSS. And I found this really awesome blogpost called ‘4 ways to create CSS that’s modular and scalable’. And one of the ways, which is SMACSS, was one of my picks from a few weeks ago. There are a couple of different styles and ways of thinking about it that I’m just discovering that I’m really excited about. And they include Object-Oriented CSS, DRY CSS, and BEM, Block, Element, Modifier. So, just different ways of thinking about CSS that is more program-y and code-y which I am personally very excited about.'},
  { user_id: "#{user1.id}", category: 'Coding', rant: 'class TasksController < ApplicationController def new @task = Task.new @users = User.all end def create @task = Task.new(allowed_params) @task.task_list = TaskList.find(params[:task_list_id]) if @task.save flash[:notice] = "Task was created successfully" redirect_to root_path else @users = User.all render :new end end def destroy Task.find(params[:id]).destroy flash[:notice] = "Task was deleted successfully" redirect_to root_path end def complete Task.find(params[:id]).toggle!(:complete) flash[:notice] = "Task was completed successfully" redirect_to root_path end private def allowed_params params.require(:task).permit(:description, :due_date, :assigned_to_id) end end'},
  { user_id: "#{user2.id}", category: 'Getting glasses', rant: 'We want you to love the look and feel of your new frames, so if they fit anything less than comfortably, let us know! Our glasses are only available in one set size, but we’d be happy to recommend a style that might fit you better. Adjusting your frames is also another easy option to improve the fit. Find a retail location that offers adjustments here. If you’re not in the area, most optical shops will make minor adjustments for free or a small fee. We are happy to reimburse you the cost of one adjustment (up to $50) within 30 days of purchase.'}
            ])