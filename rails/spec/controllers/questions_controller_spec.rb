require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "GET #index" do
  	it "renders the index template" do
  		get :index
  		expect(response).to render_template("index")
  	end

  	it "loads the list of all questions" do
  		question1 = Question.create(question: "Question 1", answer: "Answer 1")
      	question2 = Question.create(question: "Question 2", answer: "Answer 2")
      	questionList = [question1, question2]

  		total = Question.all.count
  		get :index
  		expect(assigns(:questions).length).to eq total
  		expect(assigns(:questions)).to eq(questionList)
  	end
  end

  describe "GET #new" do
  	it "renders the new template" do
  		get :new
  		expect(response).to render_template("new")
  	end

  	it "creates the new question instance" do
  		get :new
  		expect(assigns(:question)).to be_instance_of(Question)
  	end
  end

end
