(1..5).to_a.each do |number|

user = User.create(name: "User #{number}", password: "password")
survey = Survey.create(title: "Survey #{number}", user: user)
question = Question.create(text: "Question #{number}", survey: survey)
choice_1 = Choices.create(text: "Choice #{number}" , question: question)
choice_2 = Choices.create(text: "Choice #{number+1}" , question: question)
QuestionChoice.create(question: question,choice: choice_1)
QuestionChoice.create(question: question,choice: choice_2)

end
