(1..5).to_a.each do |number|
user = User.create(name: "User #{number}", password: "password")
survey = Survey.create(title: "Survey #{number}", user: user)
question = Question.create(text: "Question #{number}", survey: survey)
choice_1 = Choice.create(text: "Choice #{number}" , questions: [question])
choice_2 = Choice.create(text: "Choice #{number+1}" , questions: [question])
QuestionChoice.create(questions: question, choices: choice_1)
QuestionChoice.create(questions: question, choices: choice_2)
end

