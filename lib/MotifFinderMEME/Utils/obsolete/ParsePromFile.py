import os
import sys
import json

def makePromHTMLReports(promFilePath,htmlDir,motifList):
    promFile = open(promFilePath,'r'):
    key = ''
    seqDict = {}
    motifLocationDict = {}
    for line in promFile:
        if '>' in line:
            key = line.replace('>','')
            locDict[key] = []
        else:
            seqDict[key] = line
    for m in motifList:
        motifLocationDict[m['Iupac_signature']] = {}
        for l in m['Locations']:
            if l[0] in motifLocationDict[m['Iupac_signature']]:
                motifLocationDict[m['Iupac_signature']].append(l)
