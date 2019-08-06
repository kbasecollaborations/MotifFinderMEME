import sys
import os
import shutil
import json
import subprocess
from pprint import pprint as pp

class MemeUtil:
  def __init__(self, scratch):
      self.scratch = scratch
      pass

  def build_meme_command(self, inputFilePath, min, max, background):
      meme_dir = os.path.join(self.scratch, 'meme_out')

      outputFlag = ['-o', meme_dir, '-revcomp', '-dna', '-nmotifs', '10', '-minw', str(min), '-maxw', str(max)]

      if background == 1:
          background_gen_cmd = ['fasta-get-markov', inputFilePath, os.path.join(self.scratch, 'background.txt')]

          try:
            bk_gen = subprocess.Popen(background_gen_cmd, stdout=subprocess.PIPE, close_fds=True)
            out, err = bk_gen.communicate()
          except Exception as e:
            print(background_gen_cmd)
            raise subprocess.CalledProcessError(e)

          outputFlag.append('-bfile')
          outputFlag.append(os.path.join(self.scratch, 'background.txt'))

      command = ['meme'] + [inputFilePath] + outputFlag

      return command

  def run_meme_command(self, command):
      meme_dir = os.path.join(self.scratch, 'meme_out')

      try:
          meme_out_txt = subprocess.Popen(command, stdout=subprocess.PIPE, close_fds=True)
          out, err = meme_out_txt.communicate()
      except subprocess.CalledProcessError as e:
          pp(command)
          raise subprocess.CalledProcessError(e)

      meme_file = os.path.join(meme_dir, 'meme.txt')

      if os.path.exists(meme_file):
          return os.path.join(meme_dir, 'meme.txt')
      else:
          raise FileNotFoundError(f'Meme file: {meme_file} does not exist after running meme command.')
