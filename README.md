# Synology-nas-threat-modeling
Threat modeling and security assessment of a Synology NAS using STRIDE
## Day 1: 25/11/2025

- Création de la structure du projet
- Découverte des IP (PC: 192.168.1.42, NAS: 192.168.1.2 ou 192.168.1.23, Routeur: 192.168.1.254)
- Scan Nmap :
    - `nmap -sV 192.168.1.254` [sur le routeur ] voir \01-pratical-work\scans\
    - `nmap -sn 192.168.1.0/24` [sur tous le réseaux] voir \01-pratical-work\scans\
- Première version du diagramme réseau dans \01-pratical-work\screenshots\
- Difficulté : visualiser la topologie exacte du réseau, notamment le câblage/switchs
    Le schéma réseau est incomplet car je n’ai pas accès aux informations physiques sur le câblage ni la liste complète des switches.
