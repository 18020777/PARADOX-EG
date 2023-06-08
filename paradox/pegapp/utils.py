from datetime import time


class TimeChoices:
    def __init__(self):
        self.start_morning = 10
        self.end_morning = 12
        self.start_afternoon = 14
        self.end_afternoon = 18
        self.time_choices = self.generate_time_choices()

    def generate_time_choices(self):
        morning_choices = [(time(hour=x), '{:02d}:00'.format(x)) for x in
                           range(self.start_morning, self.end_morning + 1)]
        afternoon_choices = [(time(hour=x), '{:02d}:00'.format(x)) for x in
                             range(self.start_afternoon, self.end_afternoon + 1)]

        choices = morning_choices + afternoon_choices

        return choices
