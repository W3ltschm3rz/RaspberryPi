import logging
import os
import subprocess

from flask import Flask
from flask_ask import Ask, request, session, question, statement
import RPi.GPIO as GPIO

app = Flask(__name__)
ask = Ask(app, "/")
logging.getLogger('flask_ask').setLevel(logging.DEBUG)

STATUSON = ['on','high']
STATUSOFF = ['off','low']
elgatoOn = "bash elgatoOn.sh"
elgatoOff = "bash elgatoOff.sh"


@ask.launch
def launch():
   speech_text = 'Welcome to Raspberry Pi Automation.'
   return question(speech_text).reprompt(speech_text).simple_card(speech_text)

@ask.intent('GpioIntent', mapping = {'status':'status'})
def Gpio_Intent(status,room):
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(17,GPIO.OUT)
    if status in STATUSON:
        process = subprocess.Popen(elgatoOn.split(), stdout=subprocess.PIPE)
        output, error = process.communicate()
        return statement('turning {} lights'.format(status))
    elif status in STATUSOFF:
        process = subprocess.Popen(elgatoOff.split(), stdout=subprocess.PIPE)
        output, error = process.communicate()
        return statement('turning {} lights'.format(status))
    else:
        return statement('Sorry not possible.')

@ask.intent('AMAZON.HelpIntent')
def help():
    speech_text = 'You can say hello to me!'
    return question(speech_text).reprompt(speech_text).simple_card('HelloWorld', speech_text)


@ask.session_ended
def session_ended():
    return "{}", 200


if __name__ == '__main__':
    if 'ASK_VERIFY_REQUESTS' in os.environ:
        verify = str(os.environ.get('ASK_VERIFY_REQUESTS', '')).lower()
        if verify == 'false':
            app.config['ASK_VERIFY_REQUESTS'] = False
    app.run(debug=True)
