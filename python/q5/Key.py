class Key:
    def __init__(self, target, country):
        self._target = target
        self._country = country
    def __lt__(self, other):
        if (self._target > other._target):
            return False
        if (self._target < other._target):
            return True
        if (self._country < other._country):
            return False
        if (self._country > other._country):
            return True
        return False
    def __eq__(self, other):
        return self._target == other._target and other._country == other._country
    def __repr__(self):
        return "Key({}-{})".format(self._target, self._country)
    def __hash__(self):
        return hash(self._target) + hash(self._country)
