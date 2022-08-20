import subprocess

bashCommand = "bash elgatoOn.sh"
process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
output, error = process.communicate()
