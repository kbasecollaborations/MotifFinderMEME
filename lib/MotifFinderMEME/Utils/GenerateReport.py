import json
import sys
import os

class GenerateReport:
  def __init__(self):
      pass

  def MakeMotifReport(self, htmlDir,motifSet):
      reportPath = '/kb/module/lib/MotifFinderMEME/Utils/Report/*'
      CopyCommand = 'cp -r ' + reportPath + ' ' + htmlDir
      os.system(CopyCommand)
      jsonFName = htmlDir + '/ReportMotif.json'
      with open(jsonFName,'w') as motifjson:
          json.dump(motifSet,motifjson)
      return
