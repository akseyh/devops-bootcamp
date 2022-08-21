import falcon
import random
import os
import time

waitTime = int(os.environ.get('WAIT_TIME', '2'))


class RandomGenerator(object):
    def on_get(self, request, response):
        time.sleep(waitTime)
        number = random.randint(0, 100)
        result = {'lowerLimit': 0, 'higherLimit': 100, 'number': number}
        response.media = result


api = falcon.API()
api.add_route('/number', RandomGenerator())
