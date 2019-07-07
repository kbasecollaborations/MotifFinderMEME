import subprocess
import os

class BackgroundUtils:
  def __init__(self):
      pass

  def BuildBackground(self, fastapath):
      markovpath = '/kb/deployment/bin/meme/libexec/meme-5.0.1/fasta-get-markov'
      background_path = '/kb/module/work/tmp/background.txt'
      backgroundCommand = markovpath + ' -m 10 -dna ' + fastapath + ' ' + background_path

      try:
          out_txt = subprocess.check_output(backgroundCommand,shell=True, stderr=subprocess.STDOUT)
      except subprocess.CalledProcessError as e:
          print('************GET BACKGROUND ERROR************\n')
          print(e.returncode)
          exit(0)
      assert os.path.isfile(background_path)
