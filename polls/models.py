from datetime import datetime, timedelta
from django.utils import timezone

# Create your models here.
from django.db import models


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        return timezone.now() >= self.pub_date >= timezone.now() - timedelta(days=1)


def create_question(qtext: str, choices: [str]) -> None:
    q = Question(question_text=qtext, pub_date=timezone.now())
    q.save()
    for c in choices:
        q.choice_set.create(choice_text=c, votes=0)
    q.save()
    print(q.choice_set.all())
    print(q.choice_set.count())


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text
