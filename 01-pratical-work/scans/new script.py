import xml.etree.ElementTree as ET
import networkx as nx
import matplotlib.pyplot as plt
import re
import os

# 📥 Chemin vers ton fichier XML Nmap
xml_path = "C:/Users/leila/Projet-nas-threat-modeling/01-pratical-work/scans/scan.xml"

# 📤 Dossier de sortie pour les fichiers générés
output_dir = "C:/Users/leila/Projet-nas-threat-modeling/01-pratical-work/outputs"
os.makedirs(output_dir, exist_ok=True)

# 🧠 Dictionnaire de couleurs par rôle
role_colors = {
    "router": "red",
    "NAS": "orange",
    "printer": "purple",
    "phone": "green",
    "PC": "blue",
    "unknown": "gray"
}

# 🔍 Fonction pour deviner le rôle à partir du vendor
def guess_role(vendor):
    if vendor is None:
        return "unknown"
    vendor = vendor.lower()
    if "routerboard" in vendor:
        return "router"
    elif "synology" in vendor:
        return "NAS"
    elif "ricoh" in vendor:
        return "printer"
    elif "yealink" in vendor:
        return "phone"
    elif "intel" in vendor or "hewlett" in vendor or "hp" in vendor or "lenovo" in vendor or "lcfc" in vendor:
        return "PC"
    else:
        return "unknown"

# 🧼 Nettoyer les caractères non imprimables
def clean_text(text):
    return re.sub(r'[^\x20-\x7E]', '', text) if text else "Unknown"

# 🧱 Créer le graphe
G = nx.Graph()

# 📦 Charger le fichier XML
tree = ET.parse(xml_path)
root = tree.getroot()

# ➕ Ajouter les hôtes
for host in root.findall("host"):
    ip_elem = host.find("address[@addrtype='ipv4']")
    mac_elem = host.find("address[@addrtype='mac']")
    if ip_elem is not None:
        ip = ip_elem.get("addr")
        vendor_raw = mac_elem.get("vendor") if mac_elem is not None else None
        vendor = clean_text(vendor_raw)
        role = guess_role(vendor)
        label = f"{ip}\n{role.upper()}\n{vendor}"
        G.add_node(ip, label=label, role=role)

# 🔗 Relier tous les hôtes au routeur
for node in G.nodes:
    if G.nodes[node]["role"] != "router":
        for router in [n for n in G.nodes if G.nodes[n]["role"] == "router"]:
            G.add_edge(router, node)

# 🎨 Dessiner le graphe
pos = nx.spring_layout(G, seed=42)
labels = nx.get_node_attributes(G, "label")
colors = [role_colors[G.nodes[n]["role"]] for n in G.nodes]

plt.figure(figsize=(16, 12))
nx.draw(G, pos, with_labels=False, node_color=colors, node_size=2200, edge_color="gray")
nx.draw_networkx_labels(G, pos, labels=labels, font_size=9)
plt.title("Topologie réseau détectée par Nmap", fontsize=14)
plt.savefig(os.path.join(output_dir, "network_topology.png"))
plt.show()

# 💾 Export GraphML pour Draw.io
nx.write_graphml(G, "C:/Users/leila/Projet-nas-threat-modeling/01-pratical-work/outputs/network_topology.graphml")
