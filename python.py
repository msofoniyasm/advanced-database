class MinitermGenerator:
    @staticmethod
    def generate_horizontal_miniterms(predicates):
        return [{kv.split('=')[0].strip(): kv.split('=')[1].strip() for kv in predicate.split(' AND ')} for predicate in predicates]


# Example usage:
predicates = [
    "age = 30 AND gender = 'Male'",
    "age = 25 AND gender = 'Female'"
]

horizontal_miniterms = MinitermGenerator.generate_horizontal_miniterms(predicates)
for miniterm in horizontal_miniterms:
    print(miniterm)
