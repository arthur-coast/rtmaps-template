#!/usr/bin/env python
# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Coast Autonomous 
#      Created by Arthur JEULIN on 07/22/2024.
# **********************************************************
#
# Module : Information of which tests failed
#  

# to run the analysis on Windows : python3 ./analysis_tests.py
import os
import xml.etree.ElementTree as ET

def analyser_dossier_tests(dossier):
    # Parcourir tous les fichiers dans le dossier donné
    for fichier in os.listdir(dossier):
        if fichier.endswith('.xml'): 
            chemin_complet = os.path.join(dossier, fichier)
            analyser_resultats_tests(chemin_complet)

def analyser_resultats_tests(xml_file):
    try:
        tree = ET.parse(xml_file)
        root = tree.getroot()
        print(f"Analyse des résultats pour le fichier: {xml_file}")
        
        # Compter le nombre total de tests et le nombre d'échecs
        total_tests = root.attrib.get('tests', '0')
        total_failures = root.attrib.get('failures', '0')
        
        if int(total_failures) > 0:
            print(f"Total des tests: {total_tests}, Échecs: {total_failures}")
            
            # Détails des cas de test échoués
            for testcase in root.findall('.//testcase'):
                if testcase.find('failure') is not None:
                    name = testcase.attrib.get('name')
                    classname = testcase.attrib.get('classname')
                    print(f"Échec du test: {classname}.{name}")
        else:
            print("Tous les tests ont réussi pour ce fichier.")
    except ET.ParseError as e:
        print(f"Erreur lors de l'analyse du fichier {xml_file}: {e}")



def main():
  # Chemin du dossier contenant les rapports XML
  dossier_reports = 'C:/dev/rtmaps/coast-inventory/build/bin/test/Release/test_reports'
  analyser_dossier_tests(dossier_reports)
  return 
  
if __name__ == '__main__':
  main()