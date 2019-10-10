class Key:
    def __init__(self, target, country, date):
        self._target = target
        self._country = country
        self._date = date
    def __lt__(self, other):
        if (self._target > other._target):
            return False
        if (self._target < other._target):
            return True
        if (self._country < other._country):
            return False
        if (self._country > other._country):
            return True
        if (self._date < other._date):
            return False
        if (self._date > other._date):
            return True
        return False
    def __repr__(self):
        return "Key({}-{}-{})".format(self._target, self._country, self._date)