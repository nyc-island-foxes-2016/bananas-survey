(1..5).to_a.each do |number|
user = User.create(name: "User #{number}", password: "password")
survey = Survey.create(title: "Survey #{number}", user: user)
question = Question.create(text: "Question #{number}", survey: survey)
choice_1 = Choice.create(text: "Choice 1" )
choice_2 = Choice.create(text: "Choice 2")
QuestionChoice.create(question: question, choice: choice_1)
QuestionChoice.create(question: question, choice: choice_2)
end

